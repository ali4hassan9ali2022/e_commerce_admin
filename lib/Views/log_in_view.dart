import 'package:ecommerce_admin/Cubit/log_in_cubit/log_in_cubit.dart';
import 'package:ecommerce_admin/Widgets/log_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(),
      child: Scaffold(body: LogInViewBody()),
    );
  }
}
