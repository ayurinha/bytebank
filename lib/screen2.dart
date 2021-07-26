import 'package:bytebank/main.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  final conta;
  final valor;

  Screen2(this.conta, this.valor);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  List<Map<String, dynamic>> itens = [];
  @override
  Widget build(BuildContext context) {
    itens.add({"conta": widget.conta, "valor": widget.valor});
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: itens.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Conta " + itens[index]["conta"]),
                subtitle: Text("Valor " + itens[index]["valor"]),
              );
            },
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
        tooltip: 'Nova Transferência',
        child: Icon(Icons.add),
      ),
    );
  }
}
