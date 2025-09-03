abstract class LogInState {}
class LoginInitialState extends LogInState{}
class ChangePassworsVisibailitystate extends LogInState{}
class LoadingSignInState extends LogInState {}

class SuccessSignInState extends LogInState {}

class FailureSignInState extends LogInState {
  final String errMessage;

  FailureSignInState({required this.errMessage});
}