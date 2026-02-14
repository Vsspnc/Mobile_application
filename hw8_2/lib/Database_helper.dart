import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'user.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'appDBbmi2.db');

    return await openDatabase(
      path,
      version: 3,
      onCreate: _createDb,
      onUpgrade: _upgradeDb,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        email TEXT,
        pwd TEXT,
        weight REAL,
        height REAL,
        bmi REAL,
        bmiType TEXT,
        targetWeight REAL
      )
      ''');
  }

 Future<void> _upgradeDb(Database db, int oldVersion, int newVersion) async {
  if (oldVersion < 2) {
    await db.execute(
      'ALTER TABLE user ADD COLUMN targetWeight REAL'
    );
  }
}



  // INSERT
  Future<int> insertUser(User user) async {
    final dbClient = await db;
    return await dbClient.insert('user', user.toMap());
  }

  // QUERY
  Future<List<Map<String, dynamic>>> queryAllUsers() async {
    final dbClient = await db;
    return await dbClient.query('user');
  }

  // MAP → OBJECT
  Future<List<User>> getUsers() async {
    final usersMap = await queryAllUsers();
    return usersMap.map((map) => User.fromMap(map)).toList();
  }

  // UPDATE USER
  Future<int> updateUser(User user) async {
    final dbClient = await db;
    return await dbClient.update(
      'user',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  // DELETE USER
  Future<int> deleteUser(int id) async {
    final dbClient = await db;
    return await dbClient.delete(
      'user',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE ALL
  Future<void> deleteAllUsers() async {
    final dbClient = await db;
    await dbClient.delete('user');
  }

  // UPDATE BMI FOR ALL USERS
  Future<void> updateAllBmi() async {
    final dbClient = await db;
    final users = await getUsers();

    for (User user in users) {
      final double bmi = User.calculateBMI(user.weight, user.height);
      final String bmiType = User.determineBmiType(bmi);

      await dbClient.update(
        'user',
        {
          'bmi': bmi,
          'bmiType': bmiType,
        },
        where: 'id = ?',
        whereArgs: [user.id],
      );
    }
  }

  // INITIAL DATA (OPTIONAL)
  Future<void> initializeUsers() async {
    List<User> usersToAdd = [
      /* User( 
      username: 'John Doe', 
      email: 'john.doe@example.com', 
      pwd: 'password123', 
      weight: '70', 
      height: '175'), 
      User( 
      username: 'Jane Smith', 
      email: 'jane.smith@example.com', 
      pwd: 'password456', 
      weight: '60', 
      height: '165'), */
    ];

    for (User user in usersToAdd) {
      await insertUser(user);
    }
  }
}
