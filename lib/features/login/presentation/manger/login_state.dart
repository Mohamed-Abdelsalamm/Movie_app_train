import 'package:sql_train/features/login/data/models/user_model.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}
class LoginSuccessfully extends LoginState {
  final List<User> users;

  const LoginSuccessfully(this.users);
}
class LoginFailed extends LoginState {}
class LoginLoading extends LoginState {}
class UserVerified extends LoginState {}
class WrongPassword extends LoginState {}
class WrongEmail extends LoginState {}
