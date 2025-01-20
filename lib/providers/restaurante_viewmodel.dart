import 'package:exemplo_mvvm_lancheria/models/restaurantes.dart';
import 'package:flutter/material.dart';

class RestauranteViewModel extends ChangeNotifier {
  final List<Restaurante> listaRestaurante = [
    Restaurante(
        nome: "Restaurante do Bilu",
        distancia: "4 km",
        tempoMedio: "50 - 90 min",
        precoMinimo: "17, 00",
        avaliacao: "4.3",
        foto: "assets/restaurante.jpeg"),
  ];
}
