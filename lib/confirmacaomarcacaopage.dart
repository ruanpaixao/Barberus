import 'package:flutter/material.dart';

class confirmacaomarcacaopage extends StatelessWidget {
  final String barbeiro;
  final String servico;
  final String data;
  final String horario;

  // Construtor que aceita os dados de marcação
  confirmacaomarcacaopage({
    required this.barbeiro,
    required this.servico,
    required this.data,
    required this.horario,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmação de Marcação'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Marcação Confirmada!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Barbeiro: $barbeiro',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Serviço: $servico',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Data: $data',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Horário: $horario',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Voltar para a página anterior
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
