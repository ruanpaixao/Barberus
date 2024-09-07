class Cliente {
  int? id;
  String nome;
  String telefone;
  String email;

  Cliente({this.id, required this.nome, required this.telefone, required this.email});

  // Método para converter Cliente para Map (necessário para o sqflite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
    };
  }
}