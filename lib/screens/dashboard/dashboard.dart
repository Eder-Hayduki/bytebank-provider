import 'package:bytebank_provider/screens/dashboard/saldo.dart';
import 'package:bytebank_provider/models/saldo.dart';
import 'package:bytebank_provider/screens/deposito/form_deposito.dart';
import 'package:bytebank_provider/screens/transferencia/formulario.dart';
import 'package:bytebank_provider/screens/transferencia/lista.dart';
import 'package:bytebank_provider/screens/transferencia/recentes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bytebank Provider'),
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text(
                  'Receber',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FormularioDeposito();
                      },
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FormularioTransferencia();
                      },
                    ),
                  );
                },
                child: Text(
                  'Nova Transferência',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          Recentes(),
        ],
      ),
    );
  }
}
