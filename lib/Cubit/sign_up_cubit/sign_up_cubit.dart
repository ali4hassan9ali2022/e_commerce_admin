import 'package:ecommerce_admin/Cubit/sign_up_cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode nameNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
  IconData suffix = Icons.visibility_off_outlined;
  bool isObsecure = true;
  void changePasswordVisibility() {
    isObsecure = !isObsecure;

    suffix = isObsecure
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(ChangePassworsVisibailitystate());
  }
  // late SupabaseClient supabase = Supabase.instance.client;
  // late UserModel signUpModel;
  // Future<void> signUp() async {
  //   emit(LoadingSignUpState());
  //   try {
  //     AuthResponse user = await SupabaseHelper.signUp(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //     final uuid = const Uuid().v4();
  //     String imageUrl = await AppHelper.uploadImageToStorage(
  //       uuid: uuid,
  //       profilePic: imagePicker,
  //       supabase: supabase,
  //       imageLinkOne: "profile",
  //       imageLinkTwo: "profile",
  //     );
  //     signUpModel = UserModel(
  //       id: user.user!.id,
  //       name: nameController.text,
  //       email: emailController.text,
  //       image: imageUrl,
  //       password: passwordController.text,
  //       confirePassword: confirmPasswordController.text,
  //       createIt: DateTime.now(),
  //       userCart: [],
  //       userWish: [],
  //     );
  //     AppHelper.userModel = signUpModel;
  //     bool isAdd = await SupabaseHelper.addData(
  //       tableName: "users",
  //       values: signUpModel.toJson(),
  //     );
  //     log(user.toString());
  //     log(isAdd.toString());

  //     emit(SuccessSignUpState());
  //   } on AuthApiException catch (error) {
  //     if (error.message.contains("already registerd") ||
  //         error.statusCode == 400) {
  //       emit(FailureSignUpState(errMessage: "تم التسجيل بهذا الإيميل من قبل"));
  //     } else {
  //       emit(FailureSignUpState(errMessage: error.message));
  //     }
  //   } catch (error) {
  //     emit(FailureSignUpState(errMessage: error.toString()));
  //   }
  // }
}
