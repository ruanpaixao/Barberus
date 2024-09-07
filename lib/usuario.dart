import 'package:barber_hours/bancodedados.dart';
import 'package:flutter/material.dart';
import 'models/cliente.dart';
import 'services/database_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Cliente> _clientes = [];

  @override
  void initState() {
    super.initState();
    _loadClientes();
  }

  void _loadClientes() async {
    final clientes = await DatabaseHelper().getClientes();
    setState(() {
      _clientes = clientes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barbearia CRUD'),
      ),
      body: ListView.builder(
        itemCount: _clientes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_clientes[index].nome),
            subtitle: Text(_clientes[index].telefone),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação de adicionar novo cliente
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
