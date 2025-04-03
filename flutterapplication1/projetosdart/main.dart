abstract class Veiculo {
  String marca;
  String modelo;
  int ano;

  Veiculo(this.marca, this.modelo, this.ano);

  void exibirDetalhes();
}

class Carro extends Veiculo {
  int quantidadeDePortas;

  Carro(String marca, String modelo, int ano, this.quantidadeDePortas)
      : super(marca, modelo, ano);

  @override
  void exibirDetalhes() {
    print('Carro: $marca $modelo ($ano) - $quantidadeDePortas portas');
  }
}

class Moto extends Veiculo {
  bool temPartidaEletrica;

  Moto(String marca, String modelo, int ano, this.temPartidaEletrica)
      : super(marca, modelo, ano);

  @override
  void exibirDetalhes() {
    print(
        'Moto: $marca $modelo ($ano) - ${temPartidaEletrica ? "Com partida elétrica" : "Sem partida elétrica"}');
  }
}

void main() {
  var carro = Carro("Toyota", "Corolla", 2022, 4);
  var moto = Moto("Honda", "CB500", 2021, true);

  carro.exibirDetalhes();
  moto.exibirDetalhes();
}
