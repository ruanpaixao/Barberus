import 'package:barber_hours/barber1.dart';
import 'package:barber_hours/barber2.dart';
import 'package:barber_hours/barber3.dart';
import 'package:barber_hours/main.dart';
import 'package:flutter/material.dart';

class VerBarbeariasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ver Barbearias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ServiceButton(
              infoText: 'Serviço 1',
              price: 'R\$ 100,00',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BarbeiroInfoPage()),
                );
              },
            ),
            SizedBox(height: 16), // Espaço entre os botões
            ServiceButton(
              infoText: 'Serviço 2',
              price: 'R\$ 200,00',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BarbeiroInfoPage2()),
                );
              },
            ),
            SizedBox(height: 16),
            ServiceButton(
              infoText: 'Serviço 3',
              price: 'R\$ 300,00',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BarbeiroInfoPage3()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceButton extends StatelessWidget {
  final String infoText;
  final String price;
  final VoidCallback onTap; // Função que será chamada ao clicar no botão

  ServiceButton({
    required this.infoText,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Executa a função passada ao clicar
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green, // Cor do botão
          borderRadius: BorderRadius.circular(50), // Torna o botão oval
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Center( // Adiciona um widget Center para centralizar os filhos
          child: Column(
            children: [
              Text(
                infoText,
                textAlign: TextAlign.center, // Centraliza o texto dentro do Text
                style: TextStyle(
                  color: Colors.white, // Cor do texto
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8), // Espaço entre o texto de informações e o preço
              Text(
                price,
                textAlign: TextAlign.center, // Centraliza o texto do preço também
                style: TextStyle(
                  color: Colors.white70, // Cor do texto do preço
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetalhesServicoPage extends StatelessWidget {
  final String serviceName;
  final String servicePrice;

  DetalhesServicoPage(this.serviceName, this.servicePrice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$serviceName - $servicePrice',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
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

void main() {
  runApp(MaterialApp(
    home: BarberHoursApp(),
  ));
}
