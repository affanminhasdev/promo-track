const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.deleteRelatedOffersOnShopDelete = functions.firestore
  .document("shops/{shopId}")
  .onDelete(async (snap, context) => {
    // Obtenir l'ID du shop supprimé
    const shopId = context.params.shopId;

    // Référence à la collection 'offer'
    const offersRef = admin.firestore().collection("offer");

    try {
      // Trouver toutes les offres liées au shop supprimé
      const querySnapshot = await offersRef
        .where("shop_ref", "==", snap.ref)
        .get();

      if (querySnapshot.empty) {
        console.log("Aucune offre liée au shop supprimé.");
        return null;
      }

      // Préparer une suppression en lot
      const batch = admin.firestore().batch();

      querySnapshot.forEach((doc) => {
        batch.delete(doc.ref);
      });

      // Exécuter la suppression en lot
      await batch.commit();
      console.log(
        `Toutes les offres liées au shop ${shopId} ont été supprimées.`,
      );
      return null;
    } catch (error) {
      console.error("Erreur lors de la suppression des offres liées :", error);
      return null;
    }
  });
