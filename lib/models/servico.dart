class Servico {
  int? id;
  String nome;
  double preco;

  Servico({this.id, required this.nome, required this.preco});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
    };
  }
}
