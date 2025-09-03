
import 'package:ecommerce_admin/Cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:ecommerce_admin/Widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(body: RegisterViewBody()),
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