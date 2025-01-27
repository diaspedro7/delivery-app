class Restaurante {
  final String nome;
  final String distancia;
  final String tempoMedio;
  final String frete;
  final String avaliacao;
  final String foto;

  Restaurante(
      {required this.nome,
      required this.distancia,
      required this.tempoMedio,
      required this.frete,
      required this.avaliacao,
      required this.foto});

  factory Restaurante.fromMap(Map<String, dynamic> map) {
    return Restaurante(
      nome: map['nome'] ?? '',
      distancia: (map['distancia']) ?? '',
      frete: map['frete'] ?? '',
      avaliacao: map['avaliacao'] ?? '',
      foto: map['foto'] ?? '',
      tempoMedio: map['tempoMedio'] ?? '',
    );
  }
}
