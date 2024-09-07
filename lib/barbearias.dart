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
              imagePath: 'assets/icone.png', // Usar Image.asset
              infoText: 'Serviço 1',
              price: 'R\$ 100,00',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetalhesServicoPage('Serviço 1', 'R\$ 100,00')),
                );
              },
            ),
            SizedBox(height: 16), // Espaço entre os botões
            ServiceButton(
              imagePath: 'assets/icone.png',
              infoText: 'Serviço 2',
              price: 'R\$ 200,00',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetalhesServicoPage('Serviço 2', 'R\$ 200,00')),
                );
              },
            ),
            SizedBox(height: 16),
            ServiceButton(
              imagePath: 'assets/icone.png',
              infoText: 'Serviço 3',
              price: 'R\$ 300,00',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetalhesServicoPage('Serviço 3', 'R\$ 300,00')),
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
  final String imagePath;
  final String infoText;
  final String price;
  final VoidCallback onTap; // Função que será chamada ao clicar no botão

  ServiceButton({
    required this.imagePath,
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
        child: Row(
          children: [
            Image.asset(
              imagePath, // Exibir imagem ao invés do ícone
              width: 20.0, // Tamanho da imagem
              height: 20.0,
            ),
            SizedBox(width: 16), // Espaço entre a imagem e o texto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    infoText,
                    style: TextStyle(
                      color: Colors.white, // Cor do texto
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8), // Espaço entre o texto de informações e o preço
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.white70, // Cor do texto do preço
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
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
      body: Center(
        child: Text(
          '$serviceName - $servicePrice',
          style: TextStyle(fontSize: 24),
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
