import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_train/features/login/data/models/user_model.dart';
import 'package:sql_train/features/login/data/repo/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;

  List<User> users = [];
  bool userFound = false;
  bool passwordIsTrue = false;

  Future<void> getUsersDataDatabase({required String email, required String password}) async {
    emit(LoginLoading());
    await loginRepo.getDatabaseUser().then((value) {
      users = value;
      loginValidation(email,password);
      emit(LoginSuccessfully(value));
    }).catchError((error) {
      emit(LoginFailed());
    });
  }

  loginValidation(String email, String password) async {
    for (var user in users) {
      if(user.email == email){
        userFound = true;
        debugPrint("User Found");
        if(user.password == password){
          passwordIsTrue = true;
          debugPrint("Password true");
          break;
        }debugPrint("Password false");
      }
    }
      if(userFound && passwordIsTrue){emit(UserVerified());}
      else if (userFound && !passwordIsTrue){emit(WrongPassword());}
      else if (!userFound && !passwordIsTrue){emit(WrongEmail());}
  }
}
