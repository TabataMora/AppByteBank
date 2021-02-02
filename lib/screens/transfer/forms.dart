import 'package:bytebank_flutter/components/editor.dart';
import 'package:bytebank_flutter/modelss/transfer.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferências';
const _tipNumberAccount = 'Número da conta';
const _tipNumber = '0000';
const _tipValue = 'Valor';
const _tipValueNumber = '0.00';
const _textConfirmButton = 'Confirmar';

class FormTransfer extends StatefulWidget {
  @override
  _FormTransferState createState() => _FormTransferState();
}

class _FormTransferState extends State<FormTransfer> {
  final TextEditingController _controllerAccountNumber =
      TextEditingController();

  final TextEditingController _controllerCampValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controllerAccountNumber,
              textLabel: _tipNumberAccount,
              accountHint: _tipNumber,
            ),
            Editor(
              controller: _controllerCampValue,
              textLabel: _tipValue,
              accountHint: _tipValueNumber,
              iconData: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(
                _textConfirmButton,
              ),
              onPressed: () => _createdTransfer(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createdTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(
      _controllerAccountNumber.text,
    );
    final double value = double.tryParse(
      _controllerCampValue.text,
    );
    if (accountNumber != null && value != null) {
      final createdTransfer = Transfer(
        accountNumber,
        value,
      );
      Navigator.pop(context, createdTransfer);
    }
  }
}
