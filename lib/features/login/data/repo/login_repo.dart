import 'package:sql_train/features/login/data/models/user_model.dart';

abstract class LoginRepo {

  Future<List<User>> getDatabaseUser();

}