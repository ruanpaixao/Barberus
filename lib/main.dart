import 'package:barber_hours/barbearias.dart';
import 'package:flutter/material.dart';
import 'crud.dart'; // Importa o arquivo CRUD
import 'confirmacaomarcacaopage.dart';

void main() {
  runApp(BarberHoursApp());
}

class BarberHoursApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barberus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
    );
  }
}

class HomePage extends StatelessWidget {
  final String correctPassword = "barbeiroscadastro"; // Senha correta para adicionar serviços
  final String correctPasswordMarcacoes = "marcacoes123"; // Senha correta para marcações

  // Função para mostrar o diálogo de senha
  void _showPasswordDialog(BuildContext context, String action) {
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Digite a Senha'),
          content: TextField(
            controller: passwordController,
            obscureText: true, // Oculta o texto da senha
            decoration: InputDecoration(hintText: 'Senha'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Verifica qual ação está sendo solicitada (Serviços ou Marcações)
                if (action == 'servicos') {
                  if (passwordController.text == correctPassword) {
                    Navigator.of(context).pop(); // Fecha o diálogo
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CrudPage()), // Navega para a página CRUD
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Senha incorreta')),
                    );
                  }
                } else if (action == 'marcacoes') {
                  if (passwordController.text == correctPasswordMarcacoes) {
                    Navigator.of(context).pop(); // Fecha o diálogo
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => confirmacaomarcacaopage(barbeiro: "", servico: "", data: "", horario: ""),
                        ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Senha incorreta')),
                    );
                  }
                }
              },
              child: Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barberus'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.cut,
              size: 100.0,
              color: Colors.red,
            ),
            SizedBox(height: 20.0),
            Text(
              'Bem-vindo ao Barberus!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Sua Barbearia na Palma da Mão',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 30.0), // Espaço entre o texto e os botões

            // Botão para Ver Barbearias
            ElevatedButton(
              onPressed: () {
                print('Ver Barbearias pressionado');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerBarbeariasPage()),
                );
              },
              child: Text('Ver Barbearias'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
              ),
            ),
            SizedBox(height: 20.0), // Espaço entre os botões

            // Botão para Adicionar Serviços (navega para o CRUD com senha)
            ElevatedButton(
              onPressed: () {
                print('Adicionar Serviços pressionado');
                _showPasswordDialog(context, 'servicos'); // Mostra o diálogo de senha para serviços
              },
              child: Text('Adicionar Serviços'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                backgroundColor: Colors.green, // Cor personalizada para este botão
              ),
            ),
            SizedBox(height: 20.0), // Espaço entre os botões

            // Botão para Marcações (navega para a página de marcações com senha)
            ElevatedButton(
              onPressed: () {
                print('Marcações pressionado');
                _showPasswordDialog(context, 'marcacoes'); // Mostra o diálogo de senha para marcações
              },
              child: Text('Marcações'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                backgroundColor: Colors.orange, // Cor personalizada para este botão
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Defina uma nova página para as Marcações (exemplo básico)
class MarcacoesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marcações'),
      ),
      body: Center(
        child: Text(
          'Aqui estão as marcações!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
