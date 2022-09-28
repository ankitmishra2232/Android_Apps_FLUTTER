import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_form/model/model.dart';

import '../model/model.dart';
class DatabaseHelper{
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path,'users.db');
  return await openDatabase(
    path,
    version: 1,
    onCreate: _onCreate,
  );
  }
  Future _onCreate(Database db, int version) async{
    await db.execute(
      '''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY,
        name TEXT,
        mobile TEXT,
        email TEXT,
        date TEXT,
        genders TEXT,
        address TEXT,
        pin TEXT
      )
      '''
    );
  }
  Future<List<User>> getUsers() async{
  Database db = await instance.database;
  var users = await db.query('users',orderBy: 'name');
  List<User> userList = users.isNotEmpty
  ? users.map((c)=>User.fromMap(c)).toList()
      : [];
  return userList;
  }
  Future<int> add(User user) async{
    Database db = await instance.database;
    return await db.insert('users', user.toMap());
  }
}
