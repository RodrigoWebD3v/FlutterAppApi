sealed class Operacoes {}

class OperacaoSoma extends Operacoes {
  final double valor1;
  final double valor2;

  OperacaoSoma(this.valor1, this.valor2);
}

class OperacaoSubtracao extends Operacoes {
  final double valor1;
  final double valor2;

  OperacaoSubtracao(this.valor1, this.valor2);
}


