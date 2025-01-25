//Exemplo de Model
class Comida {
  //Variáveis
  double preco;
  String nome;
  String restaurante;
  String avaliacao;
  String foto;
  final String tempoMedio;

  //Construtor da Classe
  Comida(
      {required this.preco,
      required this.nome,
      required this.restaurante,
      required this.avaliacao,
      required this.foto,
      required this.tempoMedio});

  // //Função que trabalha os dados da classe
  // double calcularPrecoComDesconto({required double desconto}) {
  //   preco = preco - (preco * desconto);
  //   return preco;
  // }

  // Método de fábrica para criar uma instância de Comida a partir de um Map
  factory Comida.fromMap(Map<String, dynamic> map) {
    return Comida(
      nome: map['nome'] ?? '',
      preco: (map['preco'] as num?)?.toDouble() ?? 0.0,
      restaurante: map['restaurante'] ?? '',
      avaliacao: map['avaliacao'] ?? '',
      foto: map['foto'] ?? '',
      tempoMedio: map['tempoMedio'] ?? '',
    );
  }
}
