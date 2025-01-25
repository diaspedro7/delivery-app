import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exemplo_mvvm_lancheria/models/comida.dart';

class FirestoreDatabaseRepository {
  Future getDados() async {
    QuerySnapshot<Map<String, dynamic>> dado;
    try {
      dado = await FirebaseFirestore.instance.collection("produtos").get();

      return dado.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception("Erro na funcao getDados");
    }
  }

  addData(List<Comida> listaComida) async {
    try {
      for (int i = 0; i < listaComida.length; i++) {
        await FirebaseFirestore.instance.collection("produtos").add({
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
