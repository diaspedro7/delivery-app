import 'package:flutter/material.dart';

class Cards {
  String titulo;
  String descricao;
  String imagem;
  Color corFundo;
  Color corDecoration;

  Cards(
      {required this.titulo,
      required this.descricao,
      required this.imagem,
      required this.corFundo,
      required this.corDecoration});
}
