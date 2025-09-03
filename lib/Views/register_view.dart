import 'package:ecommerce_admin/Core/utils/strings.dart';
import 'package:ecommerce_admin/Widgets/app_shimmer%20.dart';
import 'package:ecommerce_admin/Widgets/custom_button.dart';
import 'package:ecommerce_admin/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
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
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                Strings.letSignUp,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                validator: (value) {
                  return null;

                  // return MyValidators.displayNamevalidator(value);
                },
                // onFieldSubmitted: (value) {
                //   FocusScope.of(context).requestFocus(signUpCibit.emailNode);
                // },
                keyboardType: TextInputType.text,
                // controller: signUpCibit.nameController,
                // focusNode: signUpCibit.nameNode,
                hintText: Strings.name,
                maxLines: 1,
                prefixIcon: Icon(Icons.person, color: Colors.grey),
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                validator: (value) {
                  return null;

                  // return MyValidators.emailValidator(value);
                },
                // onFieldSubmitted: (value) {
                //   FocusScope.of(context).requestFocus(signUpCibit.passwordNode);
                // },
                // controller: signUpCibit.emailController,
                keyboardType: TextInputType.emailAddress,
                // focusNode: signUpCibit.emailNode,
                hintText: Strings.hintEmail,
                maxLines: 1,
                prefixIcon: Icon(Icons.email, color: Colors.grey),
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                validator: (value) {
                  return null;

                  // return MyValidators.passwordValidator(value);
                },
                // onFieldSubmitted: (value) {
                //   FocusScope.of(
                //     context,
                //   ).requestFocus(signUpCibit.confirmPasswordNode);
                // },
                // controller: signUpCibit.passwordController,
                keyboardType: TextInputType.text,
                // focusNode: signUpCibit.passwordNode,
                hintText: "********",
                maxLines: 1,
                prefixIcon: Icon(Icons.password, color: Colors.grey),
                // obscureText: signUpCibit.isObsecure,
                // suffixIcon: IconButton(
                //   onPressed: () {
                //     signUpCibit.changePasswordVisibility();
                //   },
                //   icon: Icon(signUpCibit.suffix),
                // ),
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                // validator: (value) {
                //   return MyValidators.repeatPasswordValidator(
                //     value: value,
                //     password: signUpCibit.passwordController.text,
                //   );
                // },
                onFieldSubmitted: (value) {
                  // FocusScope.of(
                  //   context,
                  // ).requestFocus(signUpCibit.passwordNode);
                },
                // controller: signUpCibit.confirmPasswordController,
                keyboardType: TextInputType.text,
                // focusNode: signUpCibit.confirmPasswordNode,
                hintText: Strings.confirmPassword,
                maxLines: 1,
                prefixIcon: Icon(Icons.password, color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_off),
                ),
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                onFieldSubmitted: (value) {
                  // FocusScope.of(
                  //   context,
                  // ).requestFocus(signUpCibit.passwordNode);
                },
                // controller: signUpCibit.confirmPasswordController,
                keyboardType: TextInputType.text,
                // focusNode: signUpCibit.confirmPasswordNode,
                hintText: "Enter secret key",
                maxLines: 1,
                prefixIcon: Icon(Icons.person, color: Colors.grey),
              ),
              SizedBox(height: 40),
              CustomButton(
                // onTap: () {
                //   if (signUpCibit.globalKey.currentState!.validate()) {
                //     signUpCibit.globalKey.currentState!.save();
                //     signUpCibit.signUp();
                //   }
                // },
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
      ),
    );
  }
}


// state is LoadingSignUpState
//                           ? SizedBox(
//                               height: 20,
//                               width: 20,
//                               child: CircularProgressIndicator(),
//                             )
//                           :