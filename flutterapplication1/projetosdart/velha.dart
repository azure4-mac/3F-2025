import 'dart:io';

void JogoDaVelha() {
  List<String> tabuleiro = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  bool acabou = false;
  List<int> quadradoMagico = [4, 9, 2, 3, 5, 7, 8, 1, 6];

  void ImprimirTabuleiro() {
    print('');
    print('${tabuleiro[0]} | ${tabuleiro[1]} | ${tabuleiro[2]}');
    print('---------');
    print('${tabuleiro[3]} | ${tabuleiro[4]} | ${tabuleiro[5]}');
    print('---------');
    print('${tabuleiro[6]} | ${tabuleiro[7]} | ${tabuleiro[8]}');
    print('');
  }

  int PegarNumero() {
    while (true) {
      String input = stdin.readLineSync()!;
      try {
        int numero = int.parse(input);
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

  void Turno(String jogador) {
    int espacoColocado = PegarNumero() - 1;
    if (tabuleiro[espacoColocado] == "X" || tabuleiro[espacoColocado] == "O") {
      print("\nEspaço já ocupado. Tente colocar em outro.");
      Turno(jogador);
    } else {
      tabuleiro[espacoColocado] = jogador;
    }
  }

  bool ChecaVitoria(String jogador) {
    int jogadas = 0;

    for (int x = 0; x < 9; x++) {
      for (int y = 0; y < 9; y++) {
        for (int z = 0; z < 9; z++) {
          if (x != y && y != z && z != x) {
            if (tabuleiro[x] == jogador &&
                tabuleiro[y] == jogador &&
                tabuleiro[z] == jogador) {
              if (quadradoMagico[x] + quadradoMagico[y] + quadradoMagico[z] ==
                  15) {
                print("Jogador $jogador ganhou!\n");
                return true;
              }
            }
          }
        }
      }
    }

    for (int a = 0; a < 9; a++) {
      if (tabuleiro[a] == "X" || tabuleiro[a] == "O") {
        jogadas += 1;
      }
    }

    if (jogadas == 9) {
      print("O jogo acabou em um empate\n");
      return true;
    }

    return false;
  }

  while (!acabou) {
    ImprimirTabuleiro();
    acabou = ChecaVitoria("O");
    if (acabou) break;
    print("Jogador X, escolha um espaço.");
    Turno("X");

    ImprimirTabuleiro();
    acabou = ChecaVitoria("X");
    if (acabou) break;
    print("Jogador O, escolha um espaço.");
    Turno("O");
  }
}

void main() {
  JogoDaVelha();
}
