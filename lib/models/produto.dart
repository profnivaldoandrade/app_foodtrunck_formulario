import 'package:flutter/material.dart';

class Produto with ChangeNotifier {
  final String id;
  final String titulo;
  final String descricao;
  final List<String> ingredientes;
  final double preco;
  final String imgUrl;
  bool eFavorito;

  Produto(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.ingredientes,
      required this.preco,
      required this.imgUrl,
      this.eFavorito = false});

  void alternarFavorito() {
    eFavorito = !eFavorito;
    notifyListeners();
  }
}
