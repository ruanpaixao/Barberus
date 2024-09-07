import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Barra verde
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png', // Caminho do logo
              height: 10, // Ajuste o tamanho do logo conforme necessário
            ),
            SizedBox(width: 30),
            Text('Barberus'), // Nome do aplicativo
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/user_profile.png'), // Foto de perfil
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Nome do Usuário',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'email@exemplo.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 32),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Editar Perfil'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Ação ao clicar
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Ação ao clicar
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Ação ao clicar
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PerfilPage(),
  ));
}