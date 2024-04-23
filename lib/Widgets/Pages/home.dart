import 'package:flutter/material.dart';
import 'package:mobile_megabovino/Widgets/Functions/Barra_lateral/barraLateral.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Página Inicial'),
          ),
          body: Container(
            color: Colors.orange,
          ),
          drawer: _barraLateral(context)),
    );
  }

  Drawer _barraLateral(BuildContext context) {
    BarraLateral barraLateral = BarraLateral();

    return barraLateral.barraLateral(context);
  }
}
