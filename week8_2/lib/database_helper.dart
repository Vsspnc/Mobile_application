import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'user.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'appDB.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tbUsers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        email TEXT
      )
    ''');
  }

  // CREATE
  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('tbUsers', user.toMap());
  }

  // READ
  Future<List<Map<String, dynamic>>> queryAllUsers() async {
    final db = await database;
    return await db.query('tbUsers');
  }

  // UPDATE
  Future<int> updateUser(User user) async {
    final db = await database;
    return await db.update(
      'tbUsers',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  // DELETE
  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete(
      'tbUsers',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE ALL
  Future<int> deleteAllUsers() async {
    final db = await database;
    return await db.delete('tbUsers');
  }

  // ✅ initializeDatabase (ชื่อถูกแล้ว)
  Future<void> initializeDatabase() async {
    final db = await database;

    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM tbUsers'),
    );

    if (count == 0) {
      List<User> usersToAdd = [
        User(username: "admin", email: "admin@example.com"),
        User(username: "user1", email: "user1@example.com"),
        User(username: "user2", email: "user2@example.com"),
      ];

      for (var user in usersToAdd) {
        await insertUser(user);
      }
    }
  }
}
