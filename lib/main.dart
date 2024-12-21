import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ChuvasDeOfertasApp());
}

class ChuvasDeOfertasApp extends StatelessWidget {
  const ChuvasDeOfertasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuvas de Ofertas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> offers = [];

  @override
  void initState() {
    super.initState();
    loadOffers();
  }

  Future<void> loadOffers() async {
    final String response = await rootBundle.loadString('assets/offers.json');
    final List<dynamic> data = jsonDecode(response);
    setState(() {
      offers = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuvas de Ofertas'),
      ),
      body: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];
          return ListTile(
            title: Text(offer['name']),
            subtitle: Text('Preço: R\$${offer['price']} - Loja: ${offer['store']}'),
          );
        },
      ),
    );
  }
}
