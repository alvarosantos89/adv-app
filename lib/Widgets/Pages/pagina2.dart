import 'package:flutter/material.dart';
import 'package:mobile_megabovino/Widgets/Functions/Barra_lateral/barraLateral.dart';
import 'package:mobile_megabovino/Widgets/Functions/Execucao/pagina2_Lista.dart';

class Pagina2 extends StatelessWidget {
  const Pagina2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Página 2'),
          ),
          body: Pagina2Lista(),
          drawer: _barraLateral(context)),
    );
  }

  Drawer _barraLateral(BuildContext context) {
    BarraLateral barraLateral = BarraLateral();

    return barraLateral.barraLateral(context);
  }
}
