import 'package:flutter/material.dart';

// Lista global de serviços
class Service {
  final String name;
  final String price;
  final String barbeiroName; // Nome do barbeiro
  final String barbeariaName; // Nome da barbearia
  final String mapsLink; // Link do Google Maps
  final String whatsAppNumber; // Número do WhatsApp
  final String instagramLink; // Link do Instagram

  Service(String nomeServico, String precoServico, {
    required this.name,
    required this.price,
    this.barbeiroName = "",  // Valor padrão vazio
    this.barbeariaName = "",  // Valor padrão vazio
    this.mapsLink = "",      // Valor padrão vazio
    this.whatsAppNumber = "", // Valor padrão vazio
    this.instagramLink = "",  // Valor padrão vazio
  });
}

// Exemplo de lista de serviços
List<Service> services = [];

class CrudPage extends StatefulWidget {
  @override
  _CrudPageState createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _barbeariaController = TextEditingController(); // Controlador para Nome da Barbearia
  final TextEditingController _mapsController = TextEditingController(); // Controlador para Google Maps
  final TextEditingController _whatsAppController = TextEditingController(); // Controlador para WhatsApp
  final TextEditingController _instagramController = TextEditingController(); // Controlador para Instagram
  final _formKey = GlobalKey<FormState>();

  // Função para adicionar um serviço à lista
  void _adicionarServico() {
    final String nomeServico = _nameController.text;
    final String precoServico = _priceController.text;
    final String barbeariaNome = _barbeariaController.text; // Nome da Barbearia
    final String mapsLink = _mapsController.text;
    final String whatsAppNumber = _whatsAppController.text;
    final String instagramLink = _instagramController.text;

    if (nomeServico.isNotEmpty && precoServico.isNotEmpty && barbeariaNome.isNotEmpty) {
      setState(() {
        services.add(Service(
          nomeServico, precoServico,
          name: nomeServico,
          price: precoServico,
          barbeariaName: barbeariaNome, // Adiciona nome da barbearia
          mapsLink: mapsLink,
          whatsAppNumber: whatsAppNumber,
          instagramLink: instagramLink,
        ));
      });

      _nameController.clear();
      _priceController.clear();
      _barbeariaController.clear();
      _mapsController.clear();
      _whatsAppController.clear();
      _instagramController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Serviço adicionado!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Preencha todos os campos.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Serviço'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _barbeariaController,
              decoration: InputDecoration(labelText: 'Nome da Barbearia'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome do Serviço'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Preço do Serviço'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _mapsController,
              decoration: InputDecoration(labelText: 'Link do Google Maps'),
            ),
            TextField(
              controller: _whatsAppController,
              decoration: InputDecoration(labelText: 'Número do WhatsApp'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _instagramController,
              decoration: InputDecoration(labelText: 'Link do Instagram'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _adicionarServico,
              child: Text('Adicionar Serviço'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a página anterior
              },
              child: Text('Finalizar e Voltar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
