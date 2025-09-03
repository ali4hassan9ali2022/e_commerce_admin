import 'package:ecommerce_admin/Core/utils/strings.dart';
import 'package:ecommerce_admin/Cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:ecommerce_admin/Cubit/sign_up_cubit/sign_up_state.dart';
import 'package:ecommerce_admin/Widgets/app_shimmer%20.dart';
import 'package:ecommerce_admin/Widgets/custom_button.dart';
import 'package:ecommerce_admin/Widgets/custom_text_form_field.dart';
import 'package:ecommerce_admin/Widgets/my_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var signUpCubit = BlocProvider.of<SignUpCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: signUpCubit.globalKey,
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Align(
                    alignment: Alignment.center,
                    child: ShimmerText(text: "ShopSmart", fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Strings.welcomeBack,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    Strings.letSignUp,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    validator: (value) {
                      return MyValidators.displayNamevalidator(value);
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(
                        context,
                      ).requestFocus(signUpCubit.emailNode);
                    },
                    keyboardType: TextInputType.text,
                    controller: signUpCubit.nameController,
                    focusNode: signUpCubit.nameNode,
                    hintText: Strings.name,
                    maxLines: 1,
                    prefixIcon: Icon(Icons.person, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    validator: (value) {
                      return MyValidators.emailValidator(value);
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(
                        context,
                      ).requestFocus(signUpCubit.passwordNode);
                    },
                    controller: signUpCubit.emailController,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: signUpCubit.emailNode,
                    hintText: Strings.hintEmail,
                    maxLines: 1,
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(
                        context,
                      ).requestFocus(signUpCubit.confirmPasswordNode);
                    },
                    controller: signUpCubit.passwordController,
                    keyboardType: TextInputType.text,
                    // focusNode: signUpCibit.passwordNode,
                    hintText: "********",
                    maxLines: 1,
                    prefixIcon: Icon(Icons.password, color: Colors.grey),
                    obscureText: signUpCubit.isObsecurePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        signUpCubit.changePasswordVisibility();
                      },
                      icon: Icon(signUpCubit.suffixPassword),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    validator: (value) {
                      return MyValidators.repeatPasswordValidator(
                        value: value,
                        password: signUpCubit.passwordController.text,
                      );
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(
                        context,
                      ).requestFocus(signUpCubit.secretKeyNode);
                    },
                    controller: signUpCubit.confirmPasswordController,
                    keyboardType: TextInputType.text,
                    // focusNode: signUpCibit.confirmPasswordNode,
                    hintText: Strings.confirmPassword,
                    maxLines: 1,
                    obscureText: signUpCubit.isObsecureConPassword,
                    prefixIcon: Icon(Icons.password, color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: () {
                        signUpCubit.changeConPasswordVisibility();
                      },
                      icon: Icon(signUpCubit.suffixConPassword),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    onFieldSubmitted: (value) {
                      // FocusScope.of(
                      //   context,
                      // ).requestFocus(signUpCibit.passwordNode);
                    },
                    controller: signUpCubit.secretKeyController,
                    keyboardType: TextInputType.text,
                    focusNode: signUpCubit.secretKeyNode,
                    hintText: "Enter secret key",
                    maxLines: 1,
                    prefixIcon: Icon(Icons.person, color: Colors.grey),
                  ),
                  SizedBox(height: 40),
                  CustomButton(
                    onTap: () {
                      if (signUpCubit.globalKey.currentState!.validate()) {
                        signUpCubit.globalKey.currentState!.save();
                        // signUpCibit.signUp();
                      }
                    },
                    borderRadius: 12,
                    color: Colors.grey[200],
                    height: 40,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        Strings.signUp,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.alreadyHaveAnAccount,
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: Text(
                          Strings.signIn,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
