import 'package:app_foodtrunck/components/item_grid_produto.dart';
import 'package:app_foodtrunck/models/lista_produtos.dart';
import 'package:app_foodtrunck/models/produto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridProduto extends StatelessWidget {
  final bool mostraApenasFavoritos;

  const GridProduto(this.mostraApenasFavoritos, {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListaProdutos>(context);
    final List<Produto> carregarProdutos =
        mostraApenasFavoritos ? provider.itensFavoritos : provider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: carregarProdutos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: carregarProdutos[i],
        child: ItemGridProduto(),
      ),
    );
  }
}
