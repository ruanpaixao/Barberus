import 'package:barber_hours/confirmacaomarcacaopage.dart';
import 'package:flutter/material.dart';

class BarbeiroAgendaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: agenda.isNotEmpty
            ? ListView.builder(
          itemCount: agenda.length,
          itemBuilder: (context, index) {
            final marcacao = agenda[index];
            return Card(
              child: ListTile(
                title: Text('${marcacao.servico} para '),
                subtitle: Text('Data: ${marcacao.data} - Horário: ${marcacao.horario}'),
                leading: Icon(Icons.calendar_today),
              ),
            );
          },
        )
            : Center(
          child: Text(
            'Nenhuma marcação agendada.',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

