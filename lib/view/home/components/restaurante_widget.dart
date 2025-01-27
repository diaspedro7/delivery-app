// ignore_for_file: must_be_immutable

import 'package:exemplo_mvvm_lancheria/models/restaurantes.dart';
import 'package:flutter/material.dart';

class RestauranteWidget extends StatelessWidget {
  Restaurante restaurante;
  RestauranteWidget({
    super.key,
    required this.restaurante,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500.withOpacity(0.5),
                offset: const Offset(4.0, 4.0),
                blurRadius: 10.0,
                //spreadRadius: 0.3,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-4, -4),
                blurRadius: 10.0,
                //spreadRadius: 0.3,
              ),
            ]),
        child: LayoutBuilder(builder: (context, tileSize) {
          return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Container(
                      width: tileSize.maxWidth * 0.2,
                      height: tileSize.maxHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(restaurante.foto),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: tileSize.maxWidth * 0.65,
                            child: Text(restaurante.nome,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: tileSize.maxHeight * 0.2,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            children: [
                              Text(restaurante.distancia,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: tileSize.maxHeight * 0.15,
                                    color: Colors.grey.shade600,
                                  )),
                              SizedBox(width: tileSize.maxWidth * 0.02),
                              Text("•",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: tileSize.maxHeight * 0.15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600,
                                  )),
                              SizedBox(width: tileSize.maxWidth * 0.02),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(restaurante.avaliacao,
                                      style: TextStyle(
                                          fontSize: tileSize.maxHeight * 0.15,
                                          color: Colors.grey.shade600)),
                                  SizedBox(
                                    width: tileSize.maxWidth * 0.01,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: tileSize.maxHeight * 0.15,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(restaurante.tempoMedio,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: tileSize.maxHeight * 0.15,
                                    color: Colors.grey.shade600,
                                  )),
                              SizedBox(width: tileSize.maxWidth * 0.02),
                              Text("•",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: tileSize.maxHeight * 0.15,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(width: tileSize.maxWidth * 0.02),
                              Text(restaurante.frete,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: tileSize.maxHeight * 0.15,
                                    color: Colors.grey.shade600,
                                  )),
                            ],
                          ),
                        ])
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          //Fazer ele se tornar um botão
                          Icons.favorite_border_rounded,
                          color: Colors.grey.shade600,
                        )
                      ],
                    ),
                  )
                ],
              ));
        }));
  }
}
