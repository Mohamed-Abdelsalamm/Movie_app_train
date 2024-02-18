import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_train/features/login/data/models/user_model.dart';

const String columnId = 'id';
const String columnUserEmail = 'email';
const String columnUserPassword = 'password';
const String usersTable = 'users_table';

class UserDatabaseProvider {
  late Database db;

  static final UserDatabaseProvider instance = UserDatabaseProvider._internal();

  factory UserDatabaseProvider() {
    return instance;
  }

  UserDatabaseProvider._internal();

  Future open() async {
    db = await openDatabase(usersTable,
      version: 1,
      onCreate: (db,version) async {
      debugPrint("database Created");
      await db.execute('CREATE TABLE $usersTable ($columnId INTEGER PRIMARY KEY, $columnUserEmail TEXT ,$columnUserPassword TEXT)').then((value) {
        debugPrint("table created");
      }).catchError((error){
        debugPrint("Error on Creating Table ${error.toString()}");
      });
      },
      onOpen: (db){
        debugPrint("database Opened");
      }
    );
  }

  Future<User> insert(User user) async {
    user.id = await db.insert(usersTable, user.toMap());
    return user;
  }

  Future<List<User>> getUsers() async {
    List<Map<String, dynamic>> userMaps = await db.query(usersTable);
    if (userMaps.isEmpty) {
      return [];
    } else {
      List<User> users = [];
      for (var element in userMaps) {
        users.add(User.fromMap(element));
      }
      return users;
    }
  }

  Future<int> delete(int id) async {
    return await db.delete(usersTable, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(User user) async {
    return await db.update(usersTable, user.toMap(),
        where: '$columnId = ?', whereArgs: [user.id]);
  }

  Future close() async => db.close();
}