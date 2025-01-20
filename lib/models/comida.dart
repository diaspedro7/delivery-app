//Exemplo de Model
class Comida {
  //Variáveis
  double preco;
  String nome;
  String restaurante;
  String avaliacao;
  String foto;

  //Construtor da Classe
  Comida(
      {required this.preco,
      required this.nome,
      required this.restaurante,
      required this.avaliacao,
      required this.foto});

  //Função que trabalha os dados da classe
  double calcularPrecoComDesconto({required double desconto}) {
    preco = preco - (preco * desconto);
    return preco;
  }
}
