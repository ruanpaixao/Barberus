import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models/cliente.dart';
import 'models/servico.dart';
import 'models/agendamento.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'barber_shop.db');
    return await openDatabase(
      path,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE clientes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            telefone TEXT,
            email TEXT
          )
        ''');
        db.execute('''
          CREATE TABLE servicos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            preco REAL
          )
        ''');
        db.execute('''
          CREATE TABLE agendamentos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            clienteId INTEGER,
            servicoId INTEGER,
            dataHora TEXT,
            FOREIGN KEY (clienteId) REFERENCES clientes(id),
            FOREIGN KEY (servicoId) REFERENCES servicos(id)
          )
        ''');
      },
      version: 1,
    );
  }

  // Métodos CRUD para Cliente
  Future<int> insertCliente(Cliente cliente) async {
    final db = await database;
    return await db.insert('clientes', cliente.toMap());
  }

  Future<List<Cliente>> getClientes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('clientes');
    return List.generate(maps.length, (i) {
      return Cliente(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        telefone: maps[i]['telefone'],
        email: maps[i]['email'],
      );
    });
  }

// Métodos para Serviços e Agendamentos seriam similares
}
