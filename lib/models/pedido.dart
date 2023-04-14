import 'dart:math';

import 'package:app_foodtrunck/models/item_pedido.dart';
import 'package:app_foodtrunck/models/produto.dart';
import 'package:flutter/material.dart';

class Pedido with ChangeNotifier {
  Map<String, ItemPedido> _items = {};

  Map<String, ItemPedido> get items {
    return {..._items};
  }

  int get quantosItens {
    return _items.length;
  }

  double get totalItens {
    double total = 0.0;
    _items.forEach((key, itemCarrinho) {
      total += itemCarrinho.preco * itemCarrinho.qtd;
    });
    return total;
  }

  void addItem(Produto produto) {
    if (_items.containsKey(produto.id)) {
      _items.update(
        produto.id,
        (itemExistente) => ItemPedido(
          id: itemExistente.id,
          produtoId: itemExistente.produtoId,
          name: itemExistente.name,
          qtd: itemExistente.qtd + 1,
          preco: itemExistente.preco,
        ),
      );
    } else {
      _items.putIfAbsent(
        produto.id,
        () => ItemPedido(
          id: Random().nextDouble().toString(),
          produtoId: produto.id,
          name: produto.titulo,
          qtd: 1,
          preco: produto.preco,
        ),
      );
    }
    notifyListeners();
  }

  void removerItem(String produtoId) {
    _items.remove(produtoId);
    notifyListeners();
  }

  void removerUnicoItem(String produtoId) {
    if (!_items.containsKey(produtoId)) {
      return;
    }
    if (_items[produtoId]?.qtd == 1) {
      _items.remove(produtoId);
    } else {
      _items.update(
        produtoId,
        (itemExistente) => ItemPedido(
          id: itemExistente.id,
          produtoId: itemExistente.produtoId,
          name: itemExistente.name,
          qtd: itemExistente.qtd - 1,
          preco: itemExistente.preco,
        ),
      );
    }
    notifyListeners();
  }

  void limpar() {
    _items = {};
    notifyListeners();
  }
}
