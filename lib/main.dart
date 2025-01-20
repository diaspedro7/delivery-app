// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:exemplo_mvvm_lancheria/providers/cards_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/providers/comida_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/providers/home_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/providers/restaurante_viewmodel.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RestauranteViewModel()),
        ChangeNotifierProvider(create: (_) => ComidaViewModel()),
        ChangeNotifierProvider(create: (_) => CardsViewModel()),
        ChangeNotifierProvider(create: (_) => HomePageViewModel()),
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
