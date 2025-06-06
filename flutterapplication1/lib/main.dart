import 'package:flutter/material.dart';
import 'package:flutterapplication1/dao/dogdao.dart';
import 'package:flutterapplication1/model/dogmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Dog meucachorro = Dog(id: 1, name: 'Rex', idade: 5);
  debugPrint('Criando Cachorro...');
  await insertDog(meucachorro);
  List<Dog> dogs = List<Dog>.from(await findAll());
  debugPrint('Lendo Cachorros: $dogs');

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
