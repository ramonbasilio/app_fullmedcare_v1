import 'package:app_fullmedcare_v1/src/data/model/company.dart';
import 'package:app_fullmedcare_v1/src/utils/utils.dart';
import 'package:flutter/material.dart';

class TextDetails extends StatelessWidget {
  Company company;
  TextDetails({required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${company.address}, ${company.number}, ${company.cep}'),
        Text('${company.district}, ${company.city}, ${company.state}'),
        Text('Cadastro: ${Utils.convertDate(company.date)}')
      ],
    );
  }
}
