// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exemplo_mvvm_lancheria/firebase_options.dart';
import 'package:exemplo_mvvm_lancheria/viewmodels/cards_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/viewmodels/comida_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/viewmodels/firestore_database_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/viewmodels/home_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/viewmodels/restaurante_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/view/home/home_agreggator.dart';
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
        ProxyProvider5<ComidaViewModel, RestauranteViewModel, CardsViewModel,
            HomePageViewModel, FirestoreDatabaseViewModel, HomeAggregator>(
          update: (_, comidaVM, restauranteVM, cardsVM, homepageVM,
                  firestoreDatabaseVM, __) =>
              HomeAggregator(
            comidaVM: comidaVM,
            restauranteVM: restauranteVM,
            cardsVM: cardsVM,
            homepageVM: homepageVM,
            firestoreDatabaseVM: firestoreDatabaseVM,
          ),
        ),
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
