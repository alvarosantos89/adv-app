import 'package:flutter/material.dart';
import 'package:mobile_megabovino/Widgets/Functions/Barra_lateral/barraLateral.dart';
import 'package:mobile_megabovino/Widgets/Functions/Execucao/execucaoLista.dart';

class Execucao extends StatelessWidget {
  const Execucao({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Execução de Manejos'),
          ),
          body: ExecucaoLista(),
          drawer: _barraLateral(context)),
    );
  }

  Drawer _barraLateral(BuildContext context) {
    BarraLateral barraLateral = BarraLateral();

    return barraLateral.barraLateral(context);
  }
}
