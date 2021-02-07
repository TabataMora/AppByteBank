//import 'package:bytebank_flutter/modelss/balance-models.dart';
import 'package:flutter/material.dart';

import 'balance-dashboard.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ByteBank'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: BalanceCard(),
      ),
    );
  }
}
