import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: TelaInicial()));
}

class TelaInicial extends StatefulWidget {
  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  List<Produto> produtos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit_outlined))
          ],
          backgroundColor: Colors.grey,
          title: Center(
              child: Text("Produtos", style: TextStyle(color: Colors.black))),
        ),
        body: ListView.builder(
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              // return Text(produtos[index].nome);
              return Card(child: ListTile(title: Text(produtos[index].nome),
              subtitle: Text("R\$ ${produtos[index].preco} Quantidade: ${produtos[index].qtd}"),
              trailing: IconButton(onPressed: () {
                setState(() {
                  produtos.removeAt(index);
                });
              }, icon: Icon(Icons.delete),
              color: Colors.red,),
              ));
            }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              //Tela de Cadastro
              Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => TelaCadastro())))
                  .then((p) {
                setState(() 
                {produtos.add(p);});
              });
            },
            child: Icon(Icons.add)));
  }
}

class TelaCadastro extends StatelessWidget {
  final TextEditingController _controllernome = TextEditingController();
  final TextEditingController _controllerpreco = TextEditingController();
  final TextEditingController _controllerqtd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.ac_unit_outlined))
        ],
        backgroundColor: Colors.grey,
        title: Center(
            child:
                Text("Cadastro Item", style: TextStyle(color: Colors.black))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
                controller: _controllernome,
                decoration: InputDecoration(labelText: "Nome")),
            TextField(
              controller: _controllerpreco,
              decoration: InputDecoration(labelText: "Preço"),
            ),
            TextField(
              controller: _controllerqtd,
              decoration: InputDecoration(labelText: "Quantidade"),
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: (() {
                      _controllernome.text = "";
                      _controllerpreco.text = "";
                      _controllerqtd.text = "";
                    }),
                    child: Text("Limpar")),
                ElevatedButton(
                    onPressed: (() { 
                      if(_controllernome.text != "" && _controllerpreco.text != "" && _controllerqtd.text !=""){
                        Produto p = Produto(
                        _controllernome.text,
                        _controllerpreco.text,
                        _controllerqtd.text,
                      );
                      Navigator.pop(context, p);
                      }
                    }),
                    child: Text("Salvar"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Produto {
  String nome;
  String preco;
  String qtd;

  Produto(this.nome, this.preco, this.qtd);
}
