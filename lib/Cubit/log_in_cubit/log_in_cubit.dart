import 'package:ecommerce_admin/Cubit/log_in_cubit/log_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LoginInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  IconData suffix = Icons.visibility_off_outlined;
  bool isObsecure = true;
  void changePasswordVisibility() {
    isObsecure = !isObsecure;

    suffix = isObsecure
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(ChangePassworsVisibailitystate());
  }
  // Future<void> signIn() async {
  //   emit(LoadingSignInState());
  //   try {
  //     AuthResponse user = await SupabaseHelper.logIn(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim(),
  //     );
  //     final userId = user.user!.id;
  //     final data = await SupabaseHelper.supabase
  //         .from("users")
  //         .select()
  //         .eq("id", userId);

  //     if (data.isNotEmpty) {
  //       final userData = data.first;
  //       AppHelper.userModel = UserModel.fromJson(userData);
  //       log('UserModel after fromJson: ${AppHelper.userModel?.name}');
  //     } else {
  //       log('User profile not found in "users" table for ID: $userId');
  //     }
  //     log(user.toString());
  //     emit(SuccessSignInState());
  //   } on AuthApiException catch (error) {
  //     final messages = error.message.toLowerCase();
  //     if (messages.contains("invalid login credentials")) {
  //       emit(FailureSignInState(errMessage: ""));
  //     } else {
  //       emit(FailureSignInState(errMessage: error.message));
  //     }
  //   } catch (e) {
  //     emit(FailureSignInState(errMessage: e.toString()));
  //   }
  // }
}
