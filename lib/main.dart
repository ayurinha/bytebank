import 'package:bytebank/screen2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHomePage> {
  List<Map<String, dynamic>> itens = [];
  late String conta;
  late String valor;

  TextEditingController txtconta = TextEditingController();
  TextEditingController txtvalor = TextEditingController();

  void Transfere() {
    setState(() {
      conta = txtconta.text;
      valor = txtvalor.text;

      itens.add({"conta": conta, "valor": valor});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
              child: ListView.separated(
            shrinkWrap: true,
            itemCount: itens.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Conta " + itens[index]["conta"]),
                subtitle: Text("Valor " + itens[index]["valor"]),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          )),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (ctxt) => new AlertDialog(
                      title: Text("Nova Transferência"),
                      content: Container(
                        height: 150.0,
                        width: 300.0,
                        child: ListView(
                          padding: const EdgeInsets.all(8),
                          children: <Widget>[
                            TextField(
                              controller: txtconta,
                              decoration: InputDecoration(
                                labelText: 'Conta',
                              ),
                            ),
                            TextField(
                              controller: txtvalor,
                              decoration: InputDecoration(
                                labelText: 'Valor',
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Text('Cancelar'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {
                            Transfere();
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Text('Transferir'),
                        )
                      ]));
        },
        tooltip: 'Nova Transferência',
        child: Icon(Icons.add),
      ),
    );
  }
}
