import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exemplo_mvvm_lancheria/models/comida.dart';

class FirestoreDatabaseRepository {
  Future getProducts() async {
    QuerySnapshot<Map<String, dynamic>> data;
    try {
      data = await FirebaseFirestore.instance.collection("products").get();

      return data.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception("---Error in getProducts(): $e---");
    }
  }

  Future getRestaurants() async {
    QuerySnapshot<Map<String, dynamic>> data;
    try {
      data = await FirebaseFirestore.instance.collection("restaurants").get();

      return data.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception("---Error in getRestaurants(): $e---");
    }
  }

  addData(List<Comida> listaComida) async {
    try {
      for (int i = 0; i < listaComida.length; i++) {
        await FirebaseFirestore.instance.collection("products").add({
          "preco": listaComida[i].preco,
          "nome": listaComida[i].nome,
          "restaurante": listaComida[i].restaurante,
          "avaliacao": listaComida[i].avaliacao,
          "foto": listaComida[i].foto,
          "tempoMedio": listaComida[i].tempoMedio
        });
      }
    } catch (e) {
      throw Exception("---Erro na funcao addData: $e---");
    }
  }
}
