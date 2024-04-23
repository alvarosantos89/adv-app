import 'package:flutter/material.dart';
import 'package:mobile_megabovino/Widgets/Functions/Barra_lateral/barraLateral.dart';

class Pagina3 extends StatelessWidget {
  const Pagina3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: Text('MegaBovino - Página 3'),
          ),
          body: Container(
            color: Colors.green,
          ),
          drawer: _barraLateral(context)),
    );
  }

  Drawer _barraLateral(BuildContext context) {
    BarraLateral barraLateral = BarraLateral();

    return barraLateral.barraLateral(context);
  }
}
