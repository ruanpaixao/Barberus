import 'package:barber_hours/barbearias.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import para usar ícones FontAwesome
import 'package:url_launcher/url_launcher.dart'; // Import para abrir links

class BarbeiroInfoPage2 extends StatefulWidget {
  const BarbeiroInfoPage2({Key? key}) : super(key: key);

  @override
  _BarbeiroInfoPage2State createState() => _BarbeiroInfoPage2State();
}

class _BarbeiroInfoPage2State extends State<BarbeiroInfoPage2> {
  final String endereco = 'Avenida Exemplo, 456 - Bairro Fictício, Cidade Exemplo';
  final String numeroWhatsApp = '+55 11 98765-4322'; // Número fictício de WhatsApp
  final String linkInstagram = 'https://www.instagram.com/barbeiro_exemplo2'; // Link do Instagram
  final String linkMaps = 'https://www.google.com/maps/search/?api=1&query=-23.550520,-46.633308'; // Link para abrir no Google Maps

  TimeOfDay? _horaSelecionada;
  DateTime? _dataSelecionada;

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

  // Função para abrir o link do Google Maps
  void _abrirMapa() async {
    final Uri url = Uri.parse(linkMaps);
    if (!await launchUrl(url)) {
      throw 'Não foi possível abrir o mapa';
    }
  }

  // Função para selecionar horário
  Future<void> _selecionarHorario(BuildContext context) async {
    final TimeOfDay? horarioSelecionado = await showTimePicker(
      context: context,
      initialTime: _horaSelecionada ?? TimeOfDay.now(),
    );
    if (horarioSelecionado != null && horarioSelecionado != _horaSelecionada) {
      setState(() {
        _horaSelecionada = horarioSelecionado;
      });
    }
  }

  // Função para selecionar data
  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: _dataSelecionada ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (dataSelecionada != null && dataSelecionada != _dataSelecionada) {
      setState(() {
        _dataSelecionada = dataSelecionada;
      });
    }
  }

  // Função para enviar a marcação
  void _enviarMarcacao() {
    if (_horaSelecionada != null && _dataSelecionada != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirmação'),
          content: Text(
              'Marcação enviada para o dia ${_dataSelecionada!.day}/${_dataSelecionada!.month}/${_dataSelecionada!.year} às ${_horaSelecionada!.format(context)}.'),
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
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro'),
          content: Text('Por favor, selecione uma data e um horário.'),
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
        title: Text('Perfil do Barbeiro'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Adicionado para evitar overflow
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
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _abrirMapa,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Cor do botão
                ),
                child: Text('Ver no Mapa'),
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Contato:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: _abrirWhatsApp, // Chama a função para abrir o WhatsApp
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Marcar Dia e Horário:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _selecionarData(context), // Abre o DatePicker
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text(_dataSelecionada == null
                          ? 'Selecionar Data'
                          : '${_dataSelecionada!.day}/${_dataSelecionada!.month}/${_dataSelecionada!.year}'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _selecionarHorario(context), // Abre o TimePicker
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text(_horaSelecionada == null
                          ? 'Selecionar Horário'
                          : _horaSelecionada!.format(context)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _enviarMarcacao, // Envia a marcação
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text('Enviar Marcação'),
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
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VerBarbeariasPage(),
  ));
}
