import 'package:bytebank_flutter/modelss/transfer.dart';
import 'package:bytebank_flutter/screens/transfer/forms.dart';
import 'package:flutter/material.dart';

const _titleAppBar = 'Transferências';

class TransfersList extends StatefulWidget {
  final List<Transfer> _listTransfers = List();

  @override
  TransfersListState createState() => TransfersListState();
}

class TransfersListState extends State<TransfersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titleAppBar,
        ),
      ),
      body: ListView.builder(
        itemCount: widget._listTransfers.length,
        itemBuilder: (
          context,
          indice,
        ) {
          final transfers = widget._listTransfers[indice];
          return TransfersItens(transfers);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormTransferState();
          })).then(
            (transferenciaRecebida) => _update(transferenciaRecebida),
          );
        },
      ),
    );
  }

  void _update(Transfer createdTransfer) {
    if (createdTransfer != null) {
      setState(() {
        widget._listTransfers.add(
          createdTransfer,
        );
      });
    }
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
          _transfer.account.toString(),
        ),
        subtitle: Text(
          _transfer.value.toString(),
        ),
      ),
    );
  }
}
