import 'package:barber_hours/barbearias.dart';
import 'package:barber_hours/peril.dart';
import 'package:flutter/material.dart';

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
    );
  }
}

class HomePage extends StatelessWidget {
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
            ElevatedButton(
              onPressed: () {
                print('Perfil pressionado');
                // Adicione a navegação ou ação desejada aqui
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PerfilPage()),
                );
              },
              child: Text('Perfil'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
