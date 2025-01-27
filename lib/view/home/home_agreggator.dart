import 'package:exemplo_mvvm_lancheria/viewmodels/cards_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/viewmodels/comida_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/viewmodels/firestore_database_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/viewmodels/home_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/viewmodels/restaurante_viewmodel.dart';

class HomeAggregator {
  final ComidaViewModel comidaVM;
  final RestauranteViewModel restauranteVM;
  final CardsViewModel cardsVM;
  final HomePageViewModel homepageVM;
  final FirestoreDatabaseViewModel firestoreDatabaseVM;

  HomeAggregator({
    required this.comidaVM,
    required this.restauranteVM,
    required this.cardsVM,
    required this.homepageVM,
    required this.firestoreDatabaseVM,
  });
}
