import 'dart:math';

import '../data/model/reads.dart';
import 'package:statistics/statistics.dart';

class CalcStatitics {
  Map<int, List> calcularResultado(Reads reads) {
    Map<int, List> result = {};
    reads.leituras.forEach((indice, valor) {
      print('-------------------------------');
      print('Ref: $indice - Valores: $valor');
      print('Media: ${valor.mean}');
      print('Erro: ${valor.mean - indice}');
      print('Desvio Padrao: ${desvioPadrao(valor)}');
      print(
          'Incerteza da media: ${incertezaDaMedia(desvioPadrao(valor), valor)}');
    });
    print('-------------------------------');

    return result;
  }

  double desvioPadrao(List<double> dados) {
    if (dados.isEmpty) return 0.0; // Tratar lista vazia

    // Calcular a soma e a média
    double soma = 0.0;
    for (var x in dados) {
      soma += x;
    }
    double media = soma / dados.length;

    // Calcular a soma dos quadrados das diferenças
    double somaQuadrados = 0.0;
    for (var x in dados) {
      somaQuadrados += pow(x - media, 2);
    }

    // Calcular o desvio padrão amostral
    double desvioPadrao = sqrt(somaQuadrados / (dados.length - 1));
    return desvioPadrao;
  }

  double incertezaDaMedia(double desvioPadrao, List<double> dados) {
    return (desvioPadrao / sqrt(dados.length));
  }
}
