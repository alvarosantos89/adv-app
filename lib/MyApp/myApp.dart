// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mobile_megabovino/Widgets/Pages/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MegaBovino',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Login(),
    );
  }
}
