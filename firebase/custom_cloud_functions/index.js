const admin = require("firebase-admin/app");
admin.initializeApp();

const deleteRelatedOffersOnShopDelete = require("./delete_related_offers_on_shop_delete.js");
exports.deleteRelatedOffersOnShopDelete =
  deleteRelatedOffersOnShopDelete.deleteRelatedOffersOnShopDelete;
