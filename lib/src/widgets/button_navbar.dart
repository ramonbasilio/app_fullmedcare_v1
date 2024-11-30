import 'package:flutter/material.dart';

class ButtonNavBar extends StatelessWidget {
  GlobalKey<FormState> formKey;
  List<TextEditingController> listController;

  ButtonNavBar({
    Key? key,
    required this.formKey,
    required this.listController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 60,
                width: 250,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text('Salvar')),
              ),
              SizedBox(
                height: 60,
                width: 250,
                child: ElevatedButton(
                    onPressed: () {
                      for (var x in listController) {
                        x.clear();
                      }
                    },
                    child: const Text('Limpar')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
