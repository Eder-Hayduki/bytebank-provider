import 'package:bytebank_provider/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lista.dart';

final _titulo = 'Transferencias mais recentes';

class Recentes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _titulo,
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        Consumer<Transferencias>(
          builder: (context, listaTransferencias, child) {
            final _transferenciasRecentes =
                listaTransferencias.transferencias.reversed.toList();
            final _quantidade = listaTransferencias.transferencias.length;
            int tamanho = 3;


            if (_quantidade == 0) {
              return SemTransferenciaCadastrada();
             }

            if (_quantidade < 3) {
              tamanho = _quantidade;
            }

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: tamanho,
              shrinkWrap: true, //essa linha faz as transações aparecerem
              itemBuilder: (context, indice) {
                return ItemTransferencia(_transferenciasRecentes[indice]);
              },
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ListaTransferencias();
                },
              ),
            );
          },
          child: Text(
            'Transferencias',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }
}

class SemTransferenciaCadastrada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          'Não há transferencias recentes',
          style: TextStyle(
              fontSize: 20,
              color: Colors.grey[500],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
