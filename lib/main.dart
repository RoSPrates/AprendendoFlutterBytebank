import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controlerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controlerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Transferencia"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controlerCampoNumeroConta,
              style: TextStyle(fontSize: 25.0),
              decoration: InputDecoration(
                  labelText: "Numero da Conta", hintText: "00000"),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controlerCampoValor,
              style: TextStyle(fontSize: 25.0),
              decoration: InputDecoration(
                labelText: "Valor",
                hintText: "0,00",
                icon: Icon(Icons.monetization_on),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            onPressed: () {
              var time = DateTime.now().toLocal();
              debugPrint(
                  "clicou no confirmar as ${time.day}/${time.month}/${time.year} - ${time.hour}:${time.minute}:${time.second}");
              double valor = double.tryParse(
                          _controlerCampoValor.text.replaceAll(",", ".")) ==
                      null
                  ? 0.0
                  : double.tryParse(
                      _controlerCampoValor.text.replaceAll(",", "."));
              var t = Transferencia(valor, _controlerCampoNumeroConta.text);
              debugPrint(t.transf());
            },
            child: Text("Confirmar"),
          ),
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ItemTransferencia(
              Transferencia(100.00, "Banco: Bradesco Ag: 1253 CP: 6716378")),
          ItemTransferencia(
              Transferencia(70.00, "Banco: Caixa Ag: 6348 CP: 29499")),
          ItemTransferencia(
              Transferencia(380.00, "Banco: Itau Ag: 8453 CP: 4981636")),
          ItemTransferencia(
              Transferencia(380.00, "Banco: Santander Ag: 7439 CP: 79425")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Transferencia"),
      ),
    );
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

class Transferencia {
  final double _valor;
  final String _dadosTransferido;

  Transferencia(this._valor, this._dadosTransferido);

  String transf() =>
      "Transferemcia feita para conta: ${this._dadosTransferido}, no valor: ${this._valor}";
}
