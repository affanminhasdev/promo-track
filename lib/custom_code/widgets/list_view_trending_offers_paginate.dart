// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:promotrack/components/empty_shop/empty_shop_widget.dart';

import 'package:promotrack/components/offer_card/offer_card_widget.dart';

import 'package:firebase_pagination/firebase_pagination.dart';

class ListViewTrendingOffersPaginate extends StatefulWidget {
  const ListViewTrendingOffersPaginate({
    super.key,
    this.width,
    this.height,
    this.type,
    required this.onTap,
  });

  final double? width;
  final double? height;
  final String? type;
  final Future Function(OfferRecord offer) onTap;

  @override
  State<ListViewTrendingOffersPaginate> createState() =>
      _ListViewTrendingOffersPaginateState();
}

class _ListViewTrendingOffersPaginateState
    extends State<ListViewTrendingOffersPaginate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('offer')
          .where('type', isEqualTo: widget.type)
          .where('is_trending', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 4,
              color: Color(0xFF52B788),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          // Show EmptyShopWidget when no data
          return Center(child: EmptyShopWidget());
        }

        // Build the FirestorePagination widget
        return FirestorePagination(
          limit: 20,
          viewType: ViewType.list,
          bottomLoader: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 4,
              color: Color(0xFF52B788),
            ),
          ),
          query: FirebaseFirestore.instance
              .collection('offer')
              .where('type', isEqualTo: widget.type)
              .where('is_trending', isEqualTo: true),
          itemBuilder: (context, documentSnapshot, index) {
            final snapshot = documentSnapshot[index];
            final offerRecord = OfferRecord.fromSnapshot(snapshot);

            return Visibility(
              visible: (widget.type == offerRecord.type) ||
                  (widget.type == null || widget.type == ''),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: OfferCardWidget(
                  likeable: true,
                  isOwner: true,
                  offer: offerRecord,
                  callback: () => widget.onTap(offerRecord),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
