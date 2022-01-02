import 'package:bytebank_provider/models/transferencia.dart';
import 'package:bytebank_provider/models/transferencias.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//Função para criar o banco de dados

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbpath) {
    final String path = join(dbpath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE transferencias('
          'id INTEGER PRIMARY KEY,'
          'valor DOUBLE'
          'numeroConta INTEGER');
    }, version: 1);
  });
}

Future<List>salvar(Transferencia transferencia) {
  createDatabase().then((db) {
    final Map<String, dynamic> transferenciaMap = Map();
    transferenciaMap['id'] = transferencia.id;
    transferenciaMap['valor'] = transferencia.valor;
    transferenciaMap['numeroConta'] = transferencia.numeroConta;

    db.insert('transferencias', transferenciaMap);
  });
}

Future<List<Transferencia>> buscar() {
  createDatabase().then((db) {
    db.query('transferencias').then((maps) {
      final List<Transferencias> listaTransferencias = [];
      for (Map<String, dynamic> map in maps) {
        final Transferencia transferencia = Transferencia(
          map['id'],
          map['valor'],
          map['numeroConta'],
        );
        listaTransferencias.add(transferencia);
      }
      return listaTransferencias;
    });
  });
}
