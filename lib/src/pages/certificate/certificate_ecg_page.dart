import 'package:app_fullmedcare_v1/src/data/model/reads.dart';
import 'package:flutter/material.dart';

import '../../calc/calc.dart';

class CertificateEcgPage extends StatefulWidget {
  const CertificateEcgPage({super.key});

  @override
  State<CertificateEcgPage> createState() => _CertificateEcgPageState();
}

class _CertificateEcgPageState extends State<CertificateEcgPage> {
  // Pontos fixos de referência
  //final List<int> referencePoints = [60, 80, 100, 120, 160, 180, 240];
  final List<int> referencePoints = [60, 80];

  // Lista de TextEditingControllers para armazenar as leituras
  final Map<int, List<TextEditingController>> controllers = {};

  @override
  void initState() {
    super.initState();

    // Inicializar 3 controllers para cada ponto de referência
    for (var point in referencePoints) {
      controllers[point] = List.generate(3, (_) => TextEditingController());
    }
  }

  @override
  void dispose() {
    // Liberar memória dos controllers
    for (var point in referencePoints) {
      for (var c in controllers[point]!) {
        c.dispose();
      }
    }
    super.dispose();
  }

  void _saveData() {
    Map<int, List<double>> readings = {};

    for (var point in referencePoints) {
      readings[point] = controllers[point]!
          .map((c) => double.tryParse(c.text) ?? 0.0)
          .toList();
    }

    Reads reads = Reads(leituras: readings, aceitacao: 5);
    CalcStatitics().calcularResultado(reads);
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calibração ECG"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            for (var point in referencePoints) ...[
              Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ponto de Referência: $point",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        children: List.generate(3, (index) {
                          return Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: TextField(
                                controller: controllers[point]![index],
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                decoration: InputDecoration(
                                  labelText: "Leitura ${index + 1}",
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveData,
              child: const Text("Salvar Leituras"),
            ),
          ],
        ),
      ),
    );
  }
}
