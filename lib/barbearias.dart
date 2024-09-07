import 'package:flutter/material.dart';

class VerBarbeariasPage extends StatelessWidget {
  final List<String> barbearias = [
    'Barbearia do João',
    'Barbearia do Pedro',
    'Barbearia Elegante',
    'Barbearia Moderna',
    'Barbearia Clássica',
  ];

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
              imagePath: 'assets/icone.png', // Substitua pelo caminho da sua imagem
              infoText: 'Serviço 1',
              price: 'R\$ 100,00',
            ),
            SizedBox(height: 16), // Espaço entre os botões
            ServiceButton(
              imagePath: 'assets/icone.png',
              infoText: 'Serviço 2',
              price: 'R\$ 200,00',
            ),
            SizedBox(height: 16),
            ServiceButton(
              imagePath: 'assets/icone.png',
              infoText: 'Serviço 3',
              price: 'R\$ 300,00',
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

  ServiceButton({
    required this.imagePath,
    required this.infoText,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green, // Cor do botão
        borderRadius: BorderRadius.circular(50), // Torna o botão oval
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 5, // Largura da imagem
            height: 10, // Altura da imagem
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
    );
  }
}
