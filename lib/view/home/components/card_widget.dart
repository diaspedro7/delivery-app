import 'package:exemplo_mvvm_lancheria/models/cards.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double? backgroundDecorWidth;
  final double? imageWidth;
  final Cards card;
  const CardWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.backgroundDecorWidth,
      required this.imageWidth,
      required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height, //* 0.15,
      decoration: BoxDecoration(
          color: card.corFundo, borderRadius: BorderRadius.circular(20)),
      child: Stack(children: [
        Align(
            alignment: Alignment.centerRight,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                "assets/card.png",
                color: card.corDecoration,
                //color: Colors.green.shade900.withOpacity(0.2),
                width: backgroundDecorWidth, // * 0.55,
                fit: BoxFit.fill,
              ),
            )),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Image.asset(
              card.imagem,
              width: imageWidth, // * 0.3,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15.0, right: 8.0),
          child: LayoutBuilder(builder: (context, size) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(card.descricao,
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: size.maxHeight * 0.2,
                      color: Colors.white,
                    )),
                Text(card.titulo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.maxHeight * 0.33,
                      color: Colors.white,
                    ))
              ],
            );
          }),
        ),
      ]),
    );
  }
}
