import 'package:flutter/material.dart';
import 'package:mobile_megabovino/Services/database_execucao.dart';
import 'package:mobile_megabovino/Widgets/Functions/Execucao/pagina2_Lista.dart';
import 'package:mobile_megabovino/Widgets/Functions/Execucao/pagina2_card.dart';
import 'package:mobile_megabovino/Widgets/Functions/Execucao/item.dart';

class Pagina2ListaState extends State<Pagina2Lista> {
  late Future<List<Item>> _itens;

  @override
  void initState() {
    super.initState();
    Pagina2Execucao databaseHelper = Pagina2Execucao();
    _itens = databaseHelper.obterItensDaApi();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
      future: _itens,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ItemCard(snapshot.data![index]);
            },
          );
        } else if (snapshot.hasError) {
          return const Text('Erro ao obter dados do banco de dados');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
