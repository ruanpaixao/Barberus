import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(
        child: Text(
          'Detalhes do Perfil',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}