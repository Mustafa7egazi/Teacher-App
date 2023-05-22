import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';




class DatabaseHelper {

  // static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  // DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(),'teacher.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDatabase,
      onUpgrade: _upgradeDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        password TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS level1 (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        studentName TEXT,
        months TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS level2 (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        studentName TEXT,
        months TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS level3 (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        studentName TEXT,
        months TEXT
      )
    ''');
  }

  Future<void> _upgradeDatabase(Database db, int oldVersion, int newVersion) async {
    if (newVersion > oldVersion) {
      await db.execute('DROP TABLE IF EXISTS user');
      await db.execute('DROP TABLE IF EXISTS level1');
      await db.execute('DROP TABLE IF EXISTS level2');
      await db.execute('DROP TABLE IF EXISTS level3');
      await _createDatabase(db, newVersion);
    }
  }

  // User Table CRUD Operations
  Future<bool> isUserExists(String username, String password) async {
    Database? db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'user',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
      limit: 1,
    );
    return result.isNotEmpty;
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database? db = await database;
    return await db.insert('user', user);
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    Database? db = await database;
    return await db.query('user');
  }

  Future<int> updateUser(Map<String, dynamic> user) async {
    Database? db = await database;
    final int id = user['id'];
    return await db.update('user', user, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteUser(int id) async {
    Database? db = await database;
    return await db.delete('user', where: 'id = ?', whereArgs: [id]);
  }

  Future<int?> getUserIdByUsername(String username) async {
    Database? db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'user',
      columns: ['id'],
      where: 'username = ?',
      whereArgs: [username],
      limit: 1,
    );
    return result.isNotEmpty ? result[0]['id'] : 0;
  }

  // Level1 Table CRUD Operations

  Future<int> insertLevel1(Map<String, dynamic> level1) async {
    Database? db = await database;
    return await db.insert('level1', level1);
  }

  Future<List<Map<String, dynamic>>?> getAllLevel1() async {
    Database? db = await database;
    return await db.query('level1');
  }


  Future<int> updateLevel1(Map<String, dynamic> level1) async {
    Database? db = await database;
    final int id = level1['id'];
    return await db.update('level1', level1, where: 'id = ?', whereArgs: [id]);
  }

  Future<int?> getStudentIdByNameFromLevel1(String name) async {
    Database? db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'level1',
      columns: ['id'],
      where: 'studentName = ?',
      whereArgs: [name],
      limit: 1,
    );
    return result.isNotEmpty ? result[0]['id'] : 0;
  }

  Future<int> deleteLevel1(int id) async {
    Database? db = await database;
    return await db.delete('level1', where: 'id = ?', whereArgs: [id]);
  }

  // Level2 Table CRUD Operations

  Future<int> insertLevel2(Map<String, dynamic> level2) async {
    Database? db = await database;
    return await db.insert('level2', level2);
  }

  Future<List<Map<String, dynamic>>> getAllLevel2() async {
    Database? db = await database;
    return await db.query('level2');
  }

  Future<int> updateLevel2(Map<String, dynamic> level2) async {
    Database? db = await database;
    final int id = level2['id'];
    return await db.update('level2', level2, where: 'id = ?', whereArgs: [id]);
  }

  Future<int?> getStudentIdByNameFromLevel2(String name) async {
    Database? db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'level2',
      columns: ['id'],
      where: 'studentName = ?',
      whereArgs: [name],
      limit: 1,
    );
    return result.isNotEmpty ? result[0]['id'] : 0;
  }

  Future<int> deleteLevel2(int id) async {
    Database? db = await database;
    return await db.delete('level2', where: 'id = ?', whereArgs: [id]);
  }

  // Level3 Table CRUD Operations

  Future<int> insertLevel3(Map<String, dynamic> level3) async {
    Database? db = await database;
    return await db.insert('level3', level3);
  }

  Future<List<Map<String, dynamic>>> getAllLevel3() async {
    Database? db = await database;
    return await db.query('level3');
  }

  Future<int> updateLevel3(Map<String, dynamic> level3) async {
    Database? db = await database;
    final int id = level3['id'];
    return await db.update('level3', level3, where: 'id = ?', whereArgs: [id]);
  }

  Future<int?> getStudentIdByNameFromLevel3(String name) async {
    Database? db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'level3',
      columns: ['id'],
      where: 'studentName = ?',
      whereArgs: [name],
      limit: 1,
    );
    return result.isNotEmpty ? result[0]['id'] : 0;
  }

  Future<int> deleteLevel3(int id) async {
    Database? db = await database;
    return await db.delete('level3', where: 'id = ?', whereArgs: [id]);
  }
}

