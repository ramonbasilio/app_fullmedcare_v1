import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  FirebaseProvider firebaseProvider = Get.find();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: firebaseProvider.loadingAllFunctions(firebaseProvider),
              builder: (context, snapshot) {
                if (firebaseProvider.loadingInitial.value) {
          
                  return const Column(
                    children: [
                      Text('Carregando banco de dados'),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                } else {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Get.offAllNamed('/home');
                  });
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
