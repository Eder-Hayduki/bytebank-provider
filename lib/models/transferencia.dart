class Transferencia {
  final int id;
  final double valor;
  final int numeroConta;

  Transferencia(
      this.id,
      this.valor,
      this.numeroConta
      );

  String toStringValor(){
    return 'R\$ $valor';
  }

  String toStringConta(){
    return 'Conta $numeroConta';
  }
}
