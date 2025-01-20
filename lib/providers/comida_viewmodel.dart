import 'package:exemplo_mvvm_lancheria/models/comida.dart';
import 'package:flutter/material.dart';

//Exemplo de ViewModel da Model Comida
//Utilizando o Provider
class ComidaViewModel extends ChangeNotifier {
  //Lista de Comida
  final List<Comida> listaComida = [
    //Instancia da classe Comida
    Comida(
        preco: 20.00,
        nome: "Hamburguer pesadaoo",
        restaurante: "Restaurante do Bilu",
        avaliacao: "5.0",
        foto: "assets/hamburguer_1.jpg"),
    Comida(
        preco: 20.00,
        nome: "Hamburguer pesadaoo",
        restaurante: "Restaurante do Bilu",
        avaliacao: "5.0",
        foto: "assets/hamburguer_2.jpg"),
  ];

  //Função referente a gerenciar os dados
  void addComida(Comida comida) {
    listaComida.add(comida);
    notifyListeners();
  }
}
