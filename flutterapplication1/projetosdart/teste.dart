import 'dart:io';

class Tabuleiro {
  Map<int, String> tabuleiro = {
    1: '1',
    2: '2',
    3: '3',
    4: '4',
    5: '5',
    6: '6',
    7: '7',
    8: '8',
    9: '9'
  };

  void ImprimirTabuleiro() {
    print("${tabuleiro[1]} | ${tabuleiro[2]} | ${tabuleiro[3]}");
    print("---------");
    print("${tabuleiro[4]} | ${tabuleiro[5]} | ${tabuleiro[6]}");
    print("---------");
    print("${tabuleiro[7]} | ${tabuleiro[8]} | ${tabuleiro[9]}");
  }
}

int PegarNumero() {
  while (true) {
    String inputNumero = stdin.readLineSync()!;
    try {
      int numero = int.parse(inputNumero);
      if (numero >= 1 && numero <= 9) {
        return numero;
      } else {
        print("\nNúmero não está no tabuleiro.");
      }
    } catch (e) {
      print("\nIsso não é um número. Tente novamente.");
    }
  }
}

void main() {
  Tabuleiro t = Tabuleiro();
  bool acabou = false;

  while (!acabou) {
    t.ImprimirTabuleiro();
    print('Jogador X, escolha um espaço:');
    int n = PegarNumero();
    t.tabuleiro[n] = 'X';

    t.ImprimirTabuleiro();
    print('Jogador O, escolha um espaço:');
    n = PegarNumero();
    t.tabuleiro[n] = 'O';
  }
}
