abstract class SignupState {
  const SignupState();
}

class SignupInitial extends SignupState {}
class SignupFailed extends SignupState {}
class SignupSuccessfully extends SignupState {}
class SignupLoading extends SignupState {}
