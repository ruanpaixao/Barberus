import 'package:flutter/material.dart';

// Lista global de serviços
class Service {
  final String name;
  final String price;
  final String barbeiroName; // Nome do barbeiro
  final String mapsLink; // Link do Google Maps
  final String whatsAppNumber; // Número do WhatsApp
  final String instagramLink; // Link do Instagram

  Service({
    required this.name,
    required this.price,
    this.barbeiroName = "",  // Valor padrão vazio
    this.mapsLink = "",      // Valor padrão vazio
    this.whatsAppNumber = "", // Valor padrão vazio
    this.instagramLink = "",  // Valor padrão vazio
  });
}

// Exemplo de lista de serviços
List<Service> services = [
  Service(
    name: 'Corte de Cabelo',
    price: 'R\$ 30,00',
    barbeiroName: 'João Silva',
    mapsLink: 'https://www.google.com/maps/place/Local1',
    whatsAppNumber: '+5511998765432',
    instagramLink: 'https://www.instagram.com/barbeiro_joao',
  ),
  Service(
    name: 'Barba',
    price: 'R\$ 20,00',
    barbeiroName: 'Maria Oliveira',
    mapsLink: 'https://www.google.com/maps/place/Local2',
    whatsAppNumber: '+5511987654321',
    instagramLink: 'https://www.instagram.com/barbeiro_maria',
  ),
  // Adicione mais serviços conforme necessário
];

class CrudPage extends StatefulWidget {
  @override
  _CrudPageState createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Função para adicionar um serviço à lista
  void _adicionarServico() {
    final String nomeServico = _nameController.text;
    final String precoServico = _priceController.text;

    if (nomeServico.isNotEmpty && precoServico.isNotEmpty) {
      setState(() {
        services.add(Service(nomeServico, precoServico)); // Adiciona o serviço
      });

      _nameController.clear();
      _priceController.clear();
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
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome do Serviço'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Preço do Serviço'),
              keyboardType: TextInputType.number,
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
