import 'package:bytebank_flutter/components/editor.dart';
import 'package:bytebank_flutter/modelss/balance-models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Receber depósito';
const _tipValueNumber = '0.00';
const _tipValue = 'Valor';
const _textConfirmButton = 'Confirmar';

class FormDeposit extends StatelessWidget {
  final TextEditingController _controllerCampValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
              onPressed: () => _createdDeposit(context),
            ),
          ],
        ),
      ),
    );
  }

  _createdDeposit(BuildContext context) {
    final double value = double.tryParse(_controllerCampValue.text);
    final validatesDeposit = _validatesDeposit(value);

    if (validatesDeposit) {
      _updateStatus(context, value);
      Navigator.pop(context);
    }
  }

  _validatesDeposit(value) {
    final _filledfield = value != null;
    return _filledfield;
  }

  _updateStatus(context, value) {
    Provider.of<Balance>(context, listen: false).add(value);
  }
}
