import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Para ícones de WhatsApp e Instagram
import 'package:url_launcher/url_launcher.dart'; // Para abrir links
import 'crud.dart'; // Importa a classe Service
import 'confirmacaomarcacaopage.dart'; // Importa a página de confirmação

class BarbeiroInfoPage extends StatefulWidget {
  final Service service;

  // Construtor que aceita o parâmetro service
  BarbeiroInfoPage({required this.service});

  @override
  _BarbeiroInfoPageState createState() => _BarbeiroInfoPageState();
}

class _BarbeiroInfoPageState extends State<BarbeiroInfoPage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  // Função para abrir o mapa
  void _abrirMapa() async {
    if (widget.service.mapsLink.isNotEmpty) {
      final Uri url = Uri.parse(widget.service.mapsLink); // Link do Google Maps
      if (!await launchUrl(url)) {
        throw 'Não foi possível abrir o mapa';
      }
    } else {
      throw 'Nenhum link de mapa disponível';
    }
  }

  // Função para abrir WhatsApp
  void _abrirWhatsApp() async {
    if (widget.service.whatsAppNumber.isNotEmpty) {
      final Uri url = Uri.parse('https://wa.me/${widget.service.whatsAppNumber}');
      if (!await launchUrl(url)) {
        throw 'Não foi possível abrir o WhatsApp';
      }
    } else {
      throw 'Nenhum número de WhatsApp disponível';
    }
  }

  // Função para abrir Instagram
  void _abrirInstagram() async {
    if (widget.service.instagramLink.isNotEmpty) {
      final Uri url = Uri.parse(widget.service.instagramLink);
      if (!await launchUrl(url)) {
        throw 'Não foi possível abrir o Instagram';
      }
    } else {
      throw 'Nenhum link do Instagram disponível';
    }
  }

  // Função para selecionar a data
  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Função para selecionar o horário
  Future<void> _selecionarHorario(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  // Função para enviar marcação
  void _enviarMarcacao(BuildContext context) {
    if (_selectedDate != null && _selectedTime != null) {
      final String data = '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
      final String horario = _selectedTime!.format(context);

      // Redireciona para a página de confirmação com os detalhes da marcação
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmacaoMarcacaoPage(
            barbeiro: widget.service.barbeiroName,
            servico: widget.service.name,
            data: data,
            horario: horario,
          ),
        ),
      );
    } else {
      // Exibe um alerta caso a data ou horário não tenham sido selecionados
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro'),
          content: Text('Por favor, selecione uma data e um horário para continuar.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviço: ${widget.service.name}'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Serviço: ${widget.service.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Preço: ${widget.service.price}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            // Botão para abrir o mapa
            ElevatedButton(
              onPressed: widget.service.mapsLink.isNotEmpty ? _abrirMapa : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('Ver Endereço no Mapa'),
            ),
            SizedBox(height: 20),

            // Botão para selecionar data
            ElevatedButton(
              onPressed: () => _selecionarData(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('Escolher Data'),
            ),
            SizedBox(height: 10),
            _selectedDate != null
                ? Text(
              'Data selecionada: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
              style: TextStyle(fontSize: 16),
            )
                : Text('Nenhuma data selecionada'),

            SizedBox(height: 20),

            // Botão para selecionar horário
            ElevatedButton(
              onPressed: () => _selecionarHorario(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('Escolher Horário'),
            ),
            SizedBox(height: 10),
            _selectedTime != null
                ? Text(
              'Horário selecionado: ${_selectedTime!.format(context)}',
              style: TextStyle(fontSize: 16),
            )
                : Text('Nenhum horário selecionado'),

            SizedBox(height: 20),

            // Botão para enviar marcação
            ElevatedButton(
              onPressed: () => _enviarMarcacao(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('Enviar Marcação'),
            ),
            SizedBox(height: 20),

            // Botão do WhatsApp
            ElevatedButton.icon(
              onPressed: widget.service.whatsAppNumber.isNotEmpty ? _abrirWhatsApp : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              icon: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
              label: Text('Contato via WhatsApp'),
            ),
            SizedBox(height: 20),

            // Botão do Instagram
            ElevatedButton.icon(
              onPressed: widget.service.instagramLink.isNotEmpty ? _abrirInstagram : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
              label: Text('Instagram'),
            ),
            SizedBox(height: 20),

            // Botão de voltar
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a página anterior
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
