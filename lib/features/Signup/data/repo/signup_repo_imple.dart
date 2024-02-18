import 'package:flutter/material.dart';
import 'package:sql_train/core/database_provider.dart';
import 'package:sql_train/features/Signup/data/repo/signup_repo.dart';
import 'package:sql_train/features/login/data/models/user_model.dart';

class SignupRepoImplementation implements SignupRepo {

  final UserDatabaseProvider databaseProvider;

  SignupRepoImplementation(this.databaseProvider);


  @override
  Future<void> addToDatabase({required User user}) async {
    await databaseProvider.insert(user).then((value) {
      debugPrint("User Added Successfully");
    }).catchError((error){
      debugPrint("Failed To Added The User ${error.toString()}");
    });
  }
}