import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapplication1/dao/dogdao.dart';
import 'package:flutterapplication1/model/dogmodel.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  WidgetsFlutterBinding.ensureInitialized();
  Dog meucachorro = Dog(id: 1, name: 'Rex', idade: 5);
  debugPrint('Criando Cachorro...');
  await insertDog(meucachorro);
  findAll().then((dados) {
    for (Map<dynamic, dynamic> dado in dados) {
      debugPrint("Item: $dado");
    }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Application'),
        ),
        body: Center(
          child: Text('Cachorro inserido com sucesso!'),
        ),
      ),
    );
  }
}
