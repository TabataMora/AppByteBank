//import 'package:bytebank_flutter/modelss/balance-models.dart';
import 'package:bytebank_flutter/modelss/balance-models.dart';
import 'package:bytebank_flutter/screens/deposit/form-deposit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'balance-dashboard.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ByteBank'),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: BalanceCard(),
          ),
          RaisedButton(
            child: Text('Receber depósito'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return FormDeposit();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
