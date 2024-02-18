import 'package:sql_train/features/login/data/models/user_model.dart';

abstract class SignupRepo {
  Future<void> addToDatabase({required User user});
}