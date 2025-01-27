// ignore_for_file: prefer_const_constructors

import 'package:exemplo_mvvm_lancheria/models/comida.dart';
import 'package:exemplo_mvvm_lancheria/viewmodels/firestore_database_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/view/home/components/barra_navegacao_widget.dart';
import 'package:exemplo_mvvm_lancheria/view/home/components/card_widget.dart';
import 'package:exemplo_mvvm_lancheria/view/home/components/produto_widget.dart';
import 'package:exemplo_mvvm_lancheria/view/home/components/restaurante_widget.dart';
import 'package:exemplo_mvvm_lancheria/viewmodels/cards_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/viewmodels/comida_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/viewmodels/home_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/viewmodels/restaurante_viewmodel.dart';
import 'package:exemplo_mvvm_lancheria/view/home/home_agreggator.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeAggregator = Provider.of<HomeAggregator>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        bottomNavigationBar: const BottomNavigationBarCustom(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('PedroDias Delivery',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              )),
          actions: [
            IconButton(
              onPressed: homeAggregator.homepageVM.setSearchIsOn,
              icon: Icon(
                Icons.search_rounded,
                color: Colors.red,
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("Apertou o botao");
            // firestoreDatabaseVM.addData(comidaVM.listaComida);
            homeAggregator.firestoreDatabaseVM.getProductsData();
          },
          child: Text("Pegar dados"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 14.0, right: 14.0),
          child: LayoutBuilder(builder: (context, size) {
            return SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: homeAggregator.homepageVM.searchIsOn,
                      child: Column(
                        children: [
                          Container(
                            width: size.maxWidth,
                            height: size.maxHeight * 0.08,
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 6.0, right: 6.0),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1.5),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40))),
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Pesquisar',
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.maxHeight * 0.03,
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          width: size.maxWidth,
                          height: size.maxHeight * 0.15,
                          child: PageView.builder(
                              controller: PageController(),
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (value) => homeAggregator
                                  .homepageVM
                                  .setselectedCardIndex(value %
                                      homeAggregator.cardsVM.listaCards.length),
                              //itemCount: cardsVM.listaCards.length,
                              itemBuilder: (context, index) {
                                final realIndex = index %
                                    homeAggregator.cardsVM.listaCards
                                        .length; //To make an loop
                                debugPrint("Index: $index");

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Stack(
                                    children: [
                                      CardWidget(
                                        width: size.maxWidth,
                                        height: size.maxHeight * 0.15,
                                        backgroundDecorWidth:
                                            size.maxWidth * 0.55,
                                        imageWidth: size.maxWidth * 0.3,
                                        card: homeAggregator
                                            .cardsVM.listaCards[realIndex],
                                      ),
                                      SelectedCardWidget(
                                        cardsVM: homeAggregator.cardsVM,
                                        homepageVM: homeAggregator.homepageVM,
                                        width: size.maxWidth,
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.maxHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Mais populares",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontSize: 25.0,
                              fontSize: size.maxHeight * 0.034,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    Container(
                      height: size.maxHeight * 0.4,
                      width: size.maxWidth * 0.95,
                      padding: EdgeInsets.all(0.0),
                      child: FutureBuilder<List<Comida>>(
                        future: homeAggregator.firestoreDatabaseVM
                            .getProductsData(),
                        builder: (context, snapshot) {
                          // if (snapshot.connectionState ==
                          //     ConnectionState.waiting) {
                          //   // Mostra um indicador de carregamento enquanto os dados estão sendo carregados
                          //   return const Center(
                          //       child: CircularProgressIndicator());
                          // }
                          if (snapshot.hasError) {
                            // Mostra uma mensagem de erro se algo deu errado
                            return Center(
                              child: Text(
                                  'Erro ao carregar dados: ${snapshot.error}'),
                            );
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            // Mostra uma mensagem se não houver dados
                            return const Center(
                                child: Text('Nenhum produto encontrado.'));
                          }

                          // Renderiza os widgets quando os dados são carregados
                          final listaComida = snapshot.data!;
                          return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  //     children: comidaVM.listaComida.map((comida) {
                                  //   return Padding(
                                  //     padding: const EdgeInsets.only(right: 30.0),
                                  //     child: SizedBox(
                                  //         height: size.maxHeight * 0.35,
                                  //         child: ProdutoWidget(comida: comida)),
                                  //   );
                                  // }).toList()))),
                                  children: listaComida.map((comida) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: SizedBox(
                                      height: size.maxHeight * 0.35,
                                      child: ProdutoWidget(comida: comida)),
                                );
                              }).toList()));
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Restaurantes populares",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontSize: 25.0,
                              fontSize: size.maxHeight * 0.034,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    SizedBox(height: size.maxHeight * 0.02),
                    SizedBox(
                      //height: size.maxHeight * 0.5,
                      width: size.maxWidth,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: homeAggregator
                              .restauranteVM.listaRestaurante
                              .map((restaurante) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 18.0),
                              child: SizedBox(
                                  width: size.maxWidth * 0.95,
                                  height: size.maxHeight * 0.12,
                                  child: RestauranteWidget(
                                      restaurante: restaurante)),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ]),
            );
          }),
        ));
  }
}

class SelectedCardWidget extends StatelessWidget {
  const SelectedCardWidget({
    super.key,
    required this.cardsVM,
    required this.homepageVM,
    required this.width,
  });

  final CardsViewModel cardsVM;
  final HomePageViewModel homepageVM;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 175.0, bottom: 5.0),
        child: SizedBox(
          width: width,
          height: 15,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cardsVM.listaCards.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        color: homepageVM.selectedCardIndex == index
                            ? Colors.grey.shade800.withOpacity(0.8)
                            : Colors.grey.shade300.withOpacity(0.8),
                        shape: BoxShape.circle),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
