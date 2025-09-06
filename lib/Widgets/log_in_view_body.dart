import 'dart:developer';

import 'package:ecommerce_admin/Core/utils/app_router.dart';
import 'package:ecommerce_admin/Core/utils/strings.dart';
import 'package:ecommerce_admin/Cubit/log_in_cubit/log_in_cubit.dart';
import 'package:ecommerce_admin/Cubit/log_in_cubit/log_in_state.dart';
import 'package:ecommerce_admin/Widgets/app_shimmer%20.dart';
import 'package:ecommerce_admin/Widgets/custom_button.dart';
import 'package:ecommerce_admin/Widgets/custom_text_form_field.dart';
import 'package:ecommerce_admin/Widgets/my_validators.dart';
import 'package:ecommerce_admin/Widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var loginCubit = BlocProvider.of<LogInCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<LogInCubit, LogInState>(
        listener: (context, state) {
          if (state is SuccessSignInState) {
            GoRouter.of(context).push(AppRouter.kDashboardView);
            CustomToastWidget.showSuccessToast("Successfully Sign In");
          } else if (state is FailureSignInState) {
            CustomToastWidget.showErrorToast(state.errMessage);
            log(state.errMessage);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: loginCubit.globalKey,
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Align(
                    alignment: Alignment.center,
                    child: ShimmerText(text: "ShopSmart", fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  Text(
                    Strings.welcomeBack,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Strings.let,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 30),
                  CustomTextFormField(
                    validator: (value) {
                      return MyValidators.emailValidator(value);
                    },
                    onFieldSubmitted: (value) {
                      FocusScope.of(
                        context,
                      ).requestFocus(loginCubit.passwordNode);
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: loginCubit.emailController,
                    focusNode: loginCubit.emailNode,
                    hintText: Strings.hintEmail,
                    maxLines: 1,
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                    onFieldSubmitted: (value) {},
                    controller: loginCubit.passwordController,
                    focusNode: loginCubit.passwordNode,
                    hintText: "********",
                    maxLines: 1,
                    prefixIcon: Icon(Icons.password, color: Colors.grey),
                    obscureText: loginCubit.isObsecure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        loginCubit.changePasswordVisibility();
                      },
                      icon: Icon(loginCubit.suffix),
                    ),
                  ),
                  SizedBox(height: 7),
                  InkWell(
                    onTap: () {
                      // GoRouter.of(context).push(AppRouter.kForgotViewView);
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        Strings.forgotPassword,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic,
                          decorationColor: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  CustomButton(
                    onTap: () {
                      if (loginCubit.globalKey.currentState!.validate()) {
                        loginCubit.globalKey.currentState!.save();
                        loginCubit.signIn();
                      }
                    },
                    borderRadius: 12,
                    color: Colors.grey[200],
                    height: 40,
                    width: double.infinity,
                    child: Center(
                      child: state is LoadingSignInState
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              Strings.signIn,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.dontHaveAnAccount,
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kRegisterView);
                        },
                        child: Text(
                          Strings.signUp,
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

// state is LoadingSignInState
//                           ? SizedBox(
//                               height: 20,
//                               width: 20,
//                               child: CircularProgressIndicator(),
//                             )
//                           :
