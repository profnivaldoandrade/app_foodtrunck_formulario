import 'package:app_foodtrunck/components/app_drower.dart';
import 'package:flutter/material.dart';

class ProdutosView extends StatelessWidget {
  const ProdutosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 18),
        title: const Text('GERENCIAMENTO DE PRODUTOS'),
      ),
      drawer: const AppDrawer(),
    );
  }
}
