import 'package:exemplo_mvvm_lancheria/models/comida.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProdutoWidget extends StatelessWidget {
  Comida comida;

  ProdutoWidget({
    super.key,
    required this.comida,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: size.maxWidth * 0.58,
      //height: size.maxHeight * 0.45,
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500.withOpacity(0.4),
              offset: const Offset(4.0, 4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
          ]),
      child: LayoutBuilder(builder: (context, containerSize) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              comida.foto,
              width: containerSize.maxWidth, //* 0.9,
              height: containerSize.maxHeight * 0.59,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: containerSize.maxHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("R\$ ${comida.preco}",
                        style: TextStyle(
                          fontSize: containerSize.maxHeight * 0.065,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(children: [
                      Text(comida.avaliacao,
                          style: TextStyle(
                            fontSize: containerSize.maxHeight * 0.059,
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w600,
                          )),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: containerSize.maxHeight * 0.059,
                      )
                    ])
                  ],
                ),
                SizedBox(height: containerSize.maxHeight * 0.02),
                Text(
                  comida.nome,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: containerSize.maxHeight * 0.065,
                      color: Colors.black),
                ),
                SizedBox(height: containerSize.maxHeight * 0.02),
                Text(comida.restaurante,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: containerSize.maxHeight * 0.05,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade600)),
                Text(
                  comida.tempoMedio,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: containerSize.maxHeight * 0.05,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ]);
      }),
    );
  }
}
