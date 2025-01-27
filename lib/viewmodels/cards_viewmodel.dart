import 'package:exemplo_mvvm_lancheria/models/cards.dart';
import 'package:flutter/material.dart';

class CardsViewModel extends ChangeNotifier {
  final List<Cards> listaCards = [
    Cards(
      titulo: "20% desconto",
      descricao: "Lanches com",
      imagem: "assets/hamburguer_png.png",
      corFundo: Colors.green,
      corDecoration: Colors.green.shade900.withOpacity(0.2),
    ),
    Cards(
      titulo: "Frete Grátis",
      descricao: "Primeira compra",
      imagem: "assets/hamburguer_png.png",
      corFundo: Colors.red,
      corDecoration: Colors.red.shade900.withOpacity(0.2),
    ),
    Cards(
      titulo: "12% desconto",
      descricao: "Sobremesas com",
      imagem: "assets/acai.png",
      corFundo: Colors.purple,
      corDecoration: Colors.purple.shade900.withOpacity(0.2),
    ),
  ];
}
