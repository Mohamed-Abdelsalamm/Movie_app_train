import 'package:flutter/cupertino.dart';
import 'package:sql_train/core/database_provider.dart';
import 'package:sql_train/features/login/data/models/user_model.dart';
import 'package:sql_train/features/login/data/repo/login_repo.dart';

class LoginRepoImplementation implements LoginRepo {
  final UserDatabaseProvider databaseProvider;

  LoginRepoImplementation(this.databaseProvider);

  List<User> users = [];

  @override
  Future<List<User>> getDatabaseUser() async {
    await databaseProvider.getUsers().then((value) {
      users = value;
      debugPrint("Get User Successfully");
    }).catchError((error) {
      debugPrint("Failed To Get Users ${error.toString()}");
    });
    return users;
  }
}
