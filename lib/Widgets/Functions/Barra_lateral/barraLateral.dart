// ignore_for_file: file_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:mobile_megabovino/Widgets/Pages/execucao.dart';
import 'package:mobile_megabovino/Widgets/Pages/home.dart';
import 'package:mobile_megabovino/Widgets/Pages/pagina3.dart';

class BarraLateral {
  Drawer barraLateral(BuildContext context) {
    Drawer drawer;
    drawer = Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('MegaBovino'),
            decoration: BoxDecoration(
              color: Colors.cyan,
            ),
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              subtitle: Text('Página inicial'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _navigatorHome(context);
              }),
          ListTile(
              leading: Icon(Icons.star),
              title: Text('Execução'),
              subtitle: Text('Execução de Manejos'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _navigatorCadastro(context);
              }),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Página 3 Title'),
              subtitle: Text('Página 3 Subtitle'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _navigatorMovimentacoes(context);
              })
        ],
      ),
    );

    return drawer;
  }

  void _navigatorHome(BuildContext context) {
    //Acesso à página Home
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Home()));
  }

  void _navigatorCadastro(BuildContext context) {
    //Acesso à página Cadastro
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Execucao()));
  }

  void _navigatorMovimentacoes(BuildContext context) {
    //Acesso à página movimentações
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => Pagina3()));
  }
}
