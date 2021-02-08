import 'package:bytebank_flutter/modelss/transfer.dart';
import 'package:bytebank_flutter/modelss/transfers-models.dart';
import 'package:bytebank_flutter/screens/transfer/forms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Transferências';

class TransfersListState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titleAppBar,
        ),
      ),
      body: Consumer<Transfers>(builder: (context, transfers, child) {
        return ListView.builder(
          itemCount: transfers.transfers.length,
          itemBuilder: (
            context,
            indice,
          ) {
            final transfer = transfers.transfers[indice];
            return TransfersItens(transfer);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormTransferState();
              },
            ),
          );
        },
      ),
    );
  }
}

class TransfersItens extends StatelessWidget {
  final Transfer _transfer;

  TransfersItens(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.monetization_on,
        ),
        title: Text(
          _transfer.toStringAccount(),
        ),
        subtitle: Text(
          _transfer.toStringValue(),
        ),
      ),
    );
  }
}
