import 'package:flutter/material.dart';
import 'package:mobile_megabovino/Widgets/Functions/Execucao/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ListTile(
            title: Text(item.nome),
            subtitle: Text(item.descricao),
          ),
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_circle_right),
                color: Colors.black,
                iconSize: 40.0,
                padding: const EdgeInsets.all(8.0),
                onPressed: () {
                  // Lógica quando o ícone é pressionado
                },
                //child: const Text('Acessar Programação'),
              ),
            ],
          ),
        ]));
  }
}
