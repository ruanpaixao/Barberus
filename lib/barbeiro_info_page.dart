import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Para ícones de WhatsApp e Instagram
import 'package:url_launcher/url_launcher.dart'; // Para abrir links
import 'crud.dart'; // Importar o Service class

class BarbeiroInfoPage extends StatelessWidget {
  final Service service;

  // Construtor que aceita o parâmetro service
  BarbeiroInfoPage({required this.service});

  // Função para abrir o mapa
  void _abrirMapa() async {
    final Uri url = Uri.parse(service.mapsLink); // Link do Google Maps
    if (!await launchUrl(url)) {
      throw 'Não foi possível abrir o mapa';
    }
  }

  // Função para abrir WhatsApp
  void _abrirWhatsApp() async {
    final Uri url = Uri.parse('https://wa.me/${service.whatsAppNumber}');
    if (!await launchUrl(url)) {
      throw 'Não foi possível abrir o WhatsApp';
    }
  }

  // Função para abrir Instagram
  void _abrirInstagram() async {
    final Uri url = Uri.parse(service.instagramLink);
    if (!await launchUrl(url)) {
      throw 'Não foi possível abrir o Instagram';
    }
  }

  // Função para selecionar horário (simulada aqui)
  void _marcarHorario(BuildContext context) {
    // Exemplo de função para selecionar data/horário
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Marcar Horário'),
        content: Text('Função de marcar horário em construção!'),
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

  // Função para enviar marcação (simulada)
  void _enviarMarcacao(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Marcação enviada'),
        content: Text('Sua marcação foi enviada com sucesso!'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviço: ${service.name}'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Barbeiro: ${service.barbeiroName}', // Nome do barbeiro
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Serviço: ${service.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Preço: ${service.price}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            // Botão para abrir o mapa
            ElevatedButton(
              onPressed: _abrirMapa,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('Ver Endereço no Mapa'),
            ),
            SizedBox(height: 20),

            // Botão para marcar horário e dia
            ElevatedButton(
              onPressed: () => _marcarHorario(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('Marcar Horário e Dia'),
            ),
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
              onPressed: _abrirWhatsApp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              icon: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
              label: Text('Contato via WhatsApp'),
            ),
            SizedBox(height: 20),

            // Botão do Instagram
            ElevatedButton.icon(
              onPressed: _abrirInstagram,
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
