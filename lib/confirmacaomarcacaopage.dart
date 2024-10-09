import 'package:flutter/material.dart';
import 'barbeiroagendapage.dart';

// Classe para armazenar marcações
class Marcacao {
  final String barbeiro;
  final String servico;
  final String data;
  final String horario;

  Marcacao({
    required this.barbeiro,
    required this.servico,
    required this.data,
    required this.horario,
  });
}

// Lista global para armazenar as marcações
List<Marcacao> agenda = [];

class ConfirmacaoMarcacaoPage extends StatelessWidget {
  final String barbeiro;
  final String servico;
  final String data;
  final String horario;

  // Construtor que aceita os parâmetros da marcação
  ConfirmacaoMarcacaoPage({
    required this.barbeiro,
    required this.servico,
    required this.data,
    required this.horario,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmação de Marcação'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Detalhes da Marcação',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text('Barbeiro: $barbeiro', style: const TextStyle(fontSize: 18)),
            Text('Serviço: $servico', style: const TextStyle(fontSize: 18)),
            Text('Data: $data', style: const TextStyle(fontSize: 18)),
            Text('Horário: $horario', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Adiciona a marcação à agenda
                agenda.add(Marcacao(
                  barbeiro: barbeiro,
                  servico: servico,
                  data: data,
                  horario: horario,
                ));

                // Lógica para confirmar a marcação
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Sucesso'),
                    content: const Text('Marcação confirmada com sucesso!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Fecha o diálogo
                          Navigator.of(context).pop(); // Volta para a página anterior
                          // Se necessário, navegue para a BarbeiroAgendaPage
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const BarbeiroAgendaPage(),
                            ),
                          );
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Confirmar Marcação'),
            ),
          ],
        ),
      ),
    );
  }
}
