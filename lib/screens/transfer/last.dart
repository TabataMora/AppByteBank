import 'package:bytebank_flutter/modelss/transfers-models.dart';
import 'package:bytebank_flutter/screens/transfer/list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _title = 'Últimas transferencias';

class LastTransfers extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          _title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transfers>(builder: (context, transfers, child) {
          final _lastTransfer = transfers.transfers.reversed.toList();
          final _amount = transfers.transfers.length;
          int size = 2;

          if (_amount == 0) {
            return NoTransfers();
          }

          if (_amount < 2) {
            size = _amount;
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: size,
            shrinkWrap: true,
            itemBuilder: (context, indice) {
              return TransfersItens(
                _lastTransfer[indice],
              );
            },
          );
        }),
        RaisedButton(
          child: Text('Ver todas as transferências'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return TransfersListState();
              }),
            );
          },
        )
      ],
    );
  }
}

class NoTransfers extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Vocâ não realizou nenhuma transferência',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
