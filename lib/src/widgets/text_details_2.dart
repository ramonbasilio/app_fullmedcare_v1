import 'package:app_fullmedcare_v1/src/data/model/standar_equipment.dart';
import 'package:flutter/material.dart';

class TextDetails2 extends StatelessWidget {
  EquipmentStandard equipmentStandard;
  TextDetails2({required this.equipmentStandard, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          equipmentStandard.type,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text('Modelo: ${equipmentStandard.model}'),
        Text('Marca: ${equipmentStandard.brand}'),
        Text('NS: ${equipmentStandard.sn}'),
        Text('TAG: ${equipmentStandard.tag}'),
      ],
    );
  }
}
