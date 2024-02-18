import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sql_train/features/Signup/data/repo/signup_repo.dart';
import 'package:sql_train/features/Signup/presentation/manger/signup_state.dart';
import 'package:sql_train/features/login/data/models/user_model.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signupRepo) : super(SignupInitial());

  final SignupRepo signupRepo;

  Future<void> addUserToDatabase({required User user}) async {
    emit(SignupLoading());
    await signupRepo.addToDatabase(user: user).then((value) {
      emit(SignupSuccessfully());
    }).catchError((error){
      emit(SignupFailed());
    });
  }

}
