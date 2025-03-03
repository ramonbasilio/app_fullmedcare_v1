import 'package:app_fullmedcare_v1/firebase_options.dart';
import 'package:app_fullmedcare_v1/src/data/provider/firebase_provider.dart';
import 'package:app_fullmedcare_v1/src/data/provider/points_measur_provider.dart';
import 'package:app_fullmedcare_v1/src/data/provider/register_equipment_provider.dart';
import 'package:app_fullmedcare_v1/src/routes/name_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseProvider firebaseProvider = Get.put(FirebaseProvider());
  firebaseProvider.loadingAllFunctions(firebaseProvider);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => RegisterEquipmentProvider()),
    ChangeNotifierProvider(create: (context) => PointsMeasurProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: NameRoutes.splash,
      getPages: ListRoutes.listRoutes,
      debugShowCheckedModeBanner: false,
      title: 'Fullmedcare V1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.1)),
            child: child!);
      },
    );
  }
}
