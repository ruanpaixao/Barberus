import 'package:flutter/material.dart';
import 'confirmacaomarcacaopage.dart';

class BarbeiroAgendaPage extends StatefulWidget {
  @override
  _BarbeiroAgendaPageState createState() => _BarbeiroAgendaPageState();
}

class _BarbeiroAgendaPageState extends State<BarbeiroAgendaPage> {
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
                title: Text('${marcacao.servico} - ${marcacao.barbeiro}'),
                subtitle: Text('Data: ${marcacao.data} - Horário: ${marcacao.horario}'),
                leading: Icon(Icons.calendar_today),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteMarcacao(index),
                ),
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

  void _deleteMarcacao(int index) {
    setState(() {
      agenda.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Marcação removida com sucesso!')),
    );
  }
}
