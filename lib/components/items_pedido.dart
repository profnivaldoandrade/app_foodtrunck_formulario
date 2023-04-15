import 'package:app_foodtrunck/models/pedido.dart';
import 'package:app_foodtrunck/models/item_pedido.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemPedidoWidget extends StatelessWidget {
  final ItemPedido itemPedido;

  const ItemPedidoWidget({
    required this.itemPedido,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(itemPedido.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.onError,
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      confirmDismiss: (_) {
        return showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Tem Certez?'),
            content: const Text('Quer remover o item do pedido?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Não'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Sim'),
              ),
            ],
          ),
        );
      },
      onDismissed: (_) {
        Provider.of<Pedido>(
          context,
          listen: false,
        ).removerItem(itemPedido.produtoId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(child: Text('${itemPedido.preco}')),
              ),
            ),
            title: Text(itemPedido.name),
            subtitle: Text('Total: R\$ ${itemPedido.preco * itemPedido.qtd}'),
            trailing: Text(
              '${itemPedido.qtd}x',
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
