class Agendamento {
  int? id;
  int clienteId;
  int servicoId;
  DateTime dataHora;

  Agendamento({this.id, required this.clienteId, required this.servicoId, required this.dataHora});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clienteId': clienteId,
      'servicoId': servicoId,
      'dataHora': dataHora.toIso8601String(),
    };
  }
}
