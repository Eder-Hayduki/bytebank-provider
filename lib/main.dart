import 'package:bytebank_provider/database/database.dart';
import 'package:bytebank_provider/models/transferencias.dart';
import 'package:bytebank_provider/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/saldo.dart';
import 'models/transferencia.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Saldo(0),
      ),
      ChangeNotifierProvider(
        create: (context) => Transferencias(),
      ),
    ],
    child: BytebankApp(),
  ));
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[500],
        accentColor: Colors.blueAccent[500],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[500],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
