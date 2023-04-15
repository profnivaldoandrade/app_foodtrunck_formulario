import 'package:app_foodtrunck/models/produto.dart';
import 'package:flutter/material.dart';

class ItemProduto extends StatelessWidget {
  final Produto produto;

  const ItemProduto({
    required this.produto,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(produto.imgUrl),
      ),
      title: Text(
        produto.titulo,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              color: Theme.of(context).colorScheme.primary,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
