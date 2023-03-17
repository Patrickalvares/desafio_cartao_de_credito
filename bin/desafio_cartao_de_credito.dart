void main() {
  String cartaoInvalido = '5419825003461210';
  String cartaoValido = '6062827506852829';
  print(verificadorDeCartao(cartaoValido));
  print(verificadorDeCartao(cartaoInvalido));
}

bool verificadorDeCartao(String cartao) {
  List<String> output = [];
  int total = 0;
  int resto = 0;
  for (int i = 15; i >= 0; i--) {
    if ((i).isEven && i != 15) {
      output.add((int.parse(cartao[i]) * 2).toString());
    } else if ((i).isOdd && i != 15) {
      output.add(cartao[i]);
    }
  }
  for (int i = 0; i < output.length; i++) {
    if (int.parse(output[i]) > 9) {
      String number = output[i];
      output[i] = (int.parse(number[0]) + int.parse(number[1])).toString();
    }
  }
  for (int i = 0; i < output.length; i++) {
    total = total + int.parse(output[i]);
  }
  resto = (total % 10);
  total = 10 - resto;
  if (total == 10) {
    total = 0;
  }
  if (total == (int.parse(cartao[15]))) {
    return true;
  } else {
    return false;
  }
}
