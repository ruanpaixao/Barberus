import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Para ícones de WhatsApp e Instagram
import 'package:url_launcher/url_launcher.dart'; // Para abrir links
import 'crud.dart'; // Importa a classe Service
import 'confirmacaomarcacaopage.dart'; // Importa a página de confirmação

class BarbeiroInfoPage extends StatefulWidget {
  final Service service;

  BarbeiroInfoPage({required this.service});

  @override
  _BarbeiroInfoPageState createState() => _BarbeiroInfoPageState();
}

class _BarbeiroInfoPageState extends State<BarbeiroInfoPage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  // Controladores para capturar o nome e número do WhatsApp do cliente
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _whatsAppController = TextEditingController();

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
      // Verifica se o nome e número de WhatsApp foram preenchidos
      if (_nomeController.text.isNotEmpty && _whatsAppController.text.isNotEmpty) {
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
        // Exibe um alerta caso o nome ou número de WhatsApp não tenham sido preenchidos
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Erro'),
            content: const Text('Por favor, preencha seu nome e número de WhatsApp.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'),
              ),
            ],
          ),
        );
      }
    } else {
      // Exibe um alerta caso a data ou horário não tenham sido selecionados
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erro'),
          content: const Text('Por favor, selecione uma data e um horário para continuar.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
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
            const SizedBox(height: 20),
            Text(
              'Serviço: ${widget.service.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Preço: ${widget.service.price}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            // Campo para o nome do cliente
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Seu Nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Campo para o número do WhatsApp
            TextField(
              controller: _whatsAppController,
              decoration: const InputDecoration(
                labelText: 'Número do WhatsApp',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),

            // Ícones clicáveis para o mapa, WhatsApp e Instagram
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ícone do Google Maps
                IconButton(
                  onPressed: widget.service.mapsLink.isNotEmpty ? _abrirMapa : null,
                  icon: const FaIcon(FontAwesomeIcons.mapMarkedAlt, color: Colors.green, size: 40),
                ),
                const SizedBox(width: 20),

                // Ícone do WhatsApp
                IconButton(
                  onPressed: widget.service.whatsAppNumber.isNotEmpty ? _abrirWhatsApp : null,
                  icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green, size: 40),
                ),
                const SizedBox(width: 20),

                // Ícone do Instagram
                IconButton(
                  onPressed: widget.service.instagramLink.isNotEmpty ? _abrirInstagram : null,
                  icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.purple, size: 40),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Botão para selecionar data
            ElevatedButton(
              onPressed: () => _selecionarData(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Escolher Data'),
            ),
            const SizedBox(height: 10),
            _selectedDate != null
                ? Text(
              'Data selecionada: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
              style: const TextStyle(fontSize: 16),
            )
                : const Text('Nenhuma data selecionada'),

            const SizedBox(height: 20),

            // Botão para selecionar horário
            ElevatedButton(
              onPressed: () => _selecionarHorario(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Escolher Horário'),
            ),
            const SizedBox(height: 10),
            _selectedTime != null
                ? Text(
              'Horário selecionado: ${_selectedTime!.format(context)}',
              style: const TextStyle(fontSize: 16),
            )
                : const Text('Nenhum horário selecionado'),

            const SizedBox(height: 20),

            // Botão para enviar marcação
            ElevatedButton(
              onPressed: () => _enviarMarcacao(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Enviar Marcação'),
            ),
            const SizedBox(height: 20),

            // Botão de voltar
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a página anterior
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
