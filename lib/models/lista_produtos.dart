import 'package:app_foodtrunck/data/dados_ficticio.dart';
import 'package:app_foodtrunck/models/produto.dart';
import 'package:flutter/material.dart';

class ListaProdutos with ChangeNotifier {
  final List<Produto> _items = produtosFicticio;

  List<Produto> get items => [..._items];
  List<Produto> get itensFavoritos =>
      _items.where((produto) => produto.eFavorito).toList();

  void addProduto(Produto produto) {
    _items.add(produto);
    notifyListeners();
  }

  int get quantosItens {
    return _items.length;
  }
}
  // bool _mostraApenasFavoritos = false;

  // List<Produto> get items {
  //   if (_mostraApenasFavoritos) {
  //     return _items.where((produto) => produto.eFavorito).toList();
  //   }
  //   return [..._items];
  // }

  // void mostraApenasFavoritos() {
  //   _mostraApenasFavoritos = true;
  //   notifyListeners();
  // }

  // void mostraTodos() {
  //   _mostraApenasFavoritos = false;
  //   notifyListeners();
  // }