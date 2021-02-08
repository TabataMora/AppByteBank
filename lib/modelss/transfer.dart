class Transfer {
  final int account;
  final double value;

  Transfer(
    this.account,
    this.value,
  );

  String toStringValue() {
    return 'R\$ $value';
  }

  String toStringAccount() {
    return 'Conta $account';
  }
}
