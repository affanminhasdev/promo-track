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

import '/components/offer_card_data/offer_card_data_widget.dart';

class ListViewPaginationOffers extends StatefulWidget {
  const ListViewPaginationOffers({
    super.key,
    this.width,
    this.height,
    required this.list,
    this.callbackApi,
  });

  final double? width;
  final double? height;
  final List<OfferStruct>? list;
  final Future Function()? callbackApi;

  @override
  State<ListViewPaginationOffers> createState() =>
      _ListViewPaginationOffersState();
}

class _ListViewPaginationOffersState extends State<ListViewPaginationOffers> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;
  List<OfferStruct> _offers = [];

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);

    // Carrega os dados iniciais
    if (widget.list == null || widget.list!.isEmpty) {
      _fetchInitialData();
    } else {
      _offers = widget.list!;
    }
  }

  Future<void> _fetchInitialData() async {
    if (widget.callbackApi != null) {
      setState(() => _isLoadingMore = true);
      await widget.callbackApi!();
      setState(() {
        _offers = widget.list ?? [];
        _isLoadingMore = false;
      });
    }
  }

  void _onScroll() async {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !_isLoadingMore) {
      setState(() => _isLoadingMore = true);
      if (widget.callbackApi != null) {
        await widget.callbackApi!();
        setState(() {
          _offers = widget.list ?? _offers;
          _isLoadingMore = false;
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant ListViewPaginationOffers oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.list != oldWidget.list) {
      setState(() {
        _offers = widget.list ?? [];
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _offers.length + (_isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _offers.length) {
            // Exibe o indicador de carregamento no final da lista
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF492065),
                  ),
                ),
              ),
            );
          }

          final offer = _offers[index];

          return OfferCardDataWidget(
            likeable: true,
            offer: offer,
            isOwner: true,
            callback: widget.callbackApi,
          );
        },
      ),
    );
  }
}
