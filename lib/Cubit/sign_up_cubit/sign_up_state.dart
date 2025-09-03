abstract class SignUpState {}
class SignUpInitialState extends SignUpState{}
class ChangePassworsVisibailitystate extends SignUpState{}
class UploadProfilePic extends SignUpState{}
class RemoveProfilePic extends SignUpState{}
class LoadingSignUpState extends SignUpState {}

class SuccessSignUpState extends SignUpState {}

class FailureSignUpState extends SignUpState {
  final String errMessage;

  FailureSignUpState({required this.errMessage});
}