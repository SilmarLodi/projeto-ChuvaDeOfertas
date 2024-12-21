import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/offer.dart';

class OffersPage extends StatefulWidget {
  @override
  _OffersPageState createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  List<Offer> offers = [];

  @override
  void initState() {
    super.initState();
    loadOffers();
  }

  Future<void> loadOffers() async {
    final String response = await rootBundle.loadString('assets/offers.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      offers = data.map((item) => Offer.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promoções'),
      ),
      body: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];
          return ListTile(
            title: Text(offer.name),
            subtitle: Text('R\$ ${offer.price.toStringAsFixed(2)} - ${offer.supermarket}'),
          );
        },
      ),
    );
  }
}
