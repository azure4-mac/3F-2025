import 'dart:io';
import 'TelaFormulario.dart';
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
    debugPrint('Cachorro criado com sucesso!!');
  });

  runApp(MaterialApp(home: TelaInicial()));
}

class TelaInicial extends StatefulWidget {
  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          initialData: [],
          future: findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.none:
                return const Center(
                  child: Text("Erro na conexão."),
                );
              case ConnectionState.done:
                List<Map> dogs = snapshot.data as List<Map>;
                return ListView.builder(
                  itemCount: dogs.length,
                  itemBuilder: (context, index) {
                    final nome = dogs[index]['name'];
                    final idade = dogs[index]['idade'];
                    return ListTile(
                      title: Text(nome is String ? nome : 'Sem nome'),
                      subtitle: Text(idade != null
                          ? 'Idade: $idade'
                          : 'Idade desconhecida'),
                      trailing: IconButton(
                        onPressed: () async {
                          await deleteById(dogs[index]['id']);
                          setState(() {});
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  },
                );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TelaCadastro()),
            );
            if (result == true) {
              setState(() {});
            }
          },
          child: const Icon(Icons.add),
        ));
  }
}
