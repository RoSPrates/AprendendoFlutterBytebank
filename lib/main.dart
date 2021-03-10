import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: ListaTransferencias(),
          appBar: AppBar(
            title: Text("Transferências"),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
          ),
        ),
      ),
    );

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ItemTransferencia(Transferencia(100.00,"Banco: Bradesco Ag: 1253 CP: 6716378")),
      ItemTransferencia(Transferencia(70.00,"Banco: Caixa Ag: 6348 CP: 29499")),
      ItemTransferencia(Transferencia(380.00,"Banco: Itau Ag: 8453 CP: 4981636")),
      ItemTransferencia(Transferencia(380.00,"Banco: Santander Ag: 7439 CP: 79425")),
    ]);
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        subtitle: Text(_transferencia._dadosTransferido),
        title: Text(_transferencia._valor.toString()),
      ),
    );
  }
}

class Transferencia{
  final double _valor;
  final String _dadosTransferido;

  Transferencia(this._valor,this._dadosTransferido);
}
