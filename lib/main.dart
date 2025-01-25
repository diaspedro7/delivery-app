// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exemplo_mvvm_lancheria/firebase_options.dart';
import 'package:exemplo_mvvm_lancheria/providers/cards_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/providers/comida_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/providers/firestore_database_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/providers/home_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/providers/restaurante_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'view/home/home_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RestauranteViewModel()),
        ChangeNotifierProvider(create: (_) => ComidaViewModel()),
        ChangeNotifierProvider(create: (_) => CardsViewModel()),
        ChangeNotifierProvider(create: (_) => HomePageViewModel()),
        ChangeNotifierProvider(create: (_) => FirestoreDatabaseViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
