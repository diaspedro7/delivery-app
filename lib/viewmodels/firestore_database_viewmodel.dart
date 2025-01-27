import 'package:exemplo_mvvm_lancheria/models/comida.dart';
import 'package:exemplo_mvvm_lancheria/models/restaurantes.dart';
import 'package:exemplo_mvvm_lancheria/repositories/firestore_database_repository.dart';
import 'package:flutter/material.dart';

class FirestoreDatabaseViewModel extends ChangeNotifier {
  FirestoreDatabaseRepository instance = FirestoreDatabaseRepository();

  Future<List<Comida>> getProductsData() async {
    try {
      debugPrint("Dados do firestore:");
      List<Map<String, dynamic>> data = await instance.getProducts();

      List<Comida> listaComida =
          data.map((item) => Comida.fromMap(item)).toList();

      debugPrint("Dados do Firestore convertidos: $listaComida");
      return listaComida;
    } on Exception catch (e) {
      debugPrint("Erro ao buscar dados: $e");
      return [];
    }
  }
  Future<List<Restaurante>> getRestaurantsData() async {
    try {
      debugPrint("Dados do firestore:");
      List<Map<String, dynamic>> data = await instance.getRestaurants();

      List<Restaurante> listaRestaurant =
          data.map((item) => Restaurante.fromMap(item)).toList();

      debugPrint("Dados do Firestore convertidos: $listaRestaurant");
      return listaRestaurant;
    } on Exception catch (e) {
      debugPrint("Erro ao buscar dados: $e");
      return [];
    }
  }

  // addData(List<Comida> listaComida) {
  //   instance.addData(listaComida);
  // }
}
