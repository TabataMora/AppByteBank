//import 'package:bytebank_flutter/screens/transfer/list.dart';
import 'package:bytebank_flutter/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modelss/balance-models.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Balance(0),
    child: ByteBankApp(),
  ));
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red[900],
        accentColor: Colors.redAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.redAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
