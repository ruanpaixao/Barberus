import 'package:barber_hours/barbearias.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import para usar ícones FontAwesome
import 'package:url_launcher/url_launcher.dart'; // Import para abrir links

class BarbeiroInfoPage2 extends StatelessWidget {
  const BarbeiroInfoPage2({Key? key}) : super(key: key);

  final String endereco = 'Avenida Exemplo, 456 - Bairro Fictício, Cidade Exemplo';
  final String numeroWhatsApp = '+55 11 98765-4322'; // Número fictício de WhatsApp
  final String linkInstagram = 'https://www.instagram.com/barbeiro_exemplo2'; // Link do Instagram

  // Função para abrir o link do WhatsApp
  void _abrirWhatsApp() async {
    final Uri url = Uri.parse('https://wa.me/5511987654322'); // Link do WhatsApp com o número
    if (!await launchUrl(url)) {
      throw 'Não foi possível abrir o WhatsApp';
    }
  }

  // Função para abrir o link do Instagram
  void _abrirInstagram() async {
    final Uri url = Uri.parse(linkInstagram);
    if (!await launchUrl(url)) {
      throw 'Não foi possível abrir o Instagram';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Barbeiro'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Barbeiro Maria Oliveira',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Endereço:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              endereco,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Contato:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: _abrirWhatsApp, // Chama a função para abrir o WhatsApp
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green), // Ícone WhatsApp do FontAwesome
                  SizedBox(width: 10),
                  Text(
                    numeroWhatsApp,
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _abrirInstagram, // Chama a função para abrir o Instagram
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.instagram, color: Colors.purple), // Ícone Instagram do FontAwesome
                  SizedBox(width: 10),
                  Text(
                    'Instagram',
                    style: TextStyle(fontSize: 16, color: Colors.purple),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a página anterior
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Substituído 'primary' por 'backgroundColor'
              ),
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VerBarbeariasPage(),
  ));
}
