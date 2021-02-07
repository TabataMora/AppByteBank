import 'package:bytebank_flutter/components/editor.dart';
import 'package:bytebank_flutter/modelss/balance-models.dart';
import 'package:bytebank_flutter/modelss/transfer.dart';
import 'package:bytebank_flutter/modelss/transfers-models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Criando Transferências';
const _tipNumberAccount = 'Número da conta';
const _tipNumber = '0000';
const _tipValue = 'Valor';
const _tipValueNumber = '0.00';
const _textConfirmButton = 'Confirmar';

class FormTransferState extends StatelessWidget {
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
    final validatesTransfer = _validatesTransfer(context, accountNumber, value);
    if (validatesTransfer) {
      final newTransfer = Transfer(
        accountNumber,
        value,
      );

      _updateStatus(context, newTransfer, value);

      Navigator.pop(context);
    }
  }

  _validatesTransfer(context, accountNumber, value) {
    final _filledFields = accountNumber != null && value != null;
    final _enoughBalance = value <=
        Provider.of<Balance>(
          context,
          listen: false,
        ).value;

    return _filledFields && _enoughBalance;
  }

  _updateStatus(context, newTransfer, value) {
    Provider.of<Transfers>(context, listen: false).add(newTransfer);
    Provider.of<Balance>(context, listen: false).subtracts(value);
  }
}
