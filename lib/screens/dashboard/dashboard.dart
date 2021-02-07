import 'package:bytebank_flutter/modelss/balance.dart';
import 'package:bytebank_flutter/screens/dashboard/balance.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ByteBank'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: BalanceCard(Balance(10.00)),
      ),
    );
  }
}
