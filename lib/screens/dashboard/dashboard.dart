import 'package:bytebank_flutter/screens/deposit/form-deposit.dart';
import 'package:bytebank_flutter/screens/transfer/forms.dart';
import 'package:bytebank_flutter/screens/transfer/last.dart';
import 'package:flutter/material.dart';

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
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
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
              RaisedButton(
                child: Text('Nova transferência'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return FormTransferState();
                    }),
                  );
                },
              )
            ],
          ),
          LastTransfers(),
        ],
      ),
    );
  }
}
