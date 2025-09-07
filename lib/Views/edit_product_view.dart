import 'package:ecommerce_admin/Cubit/edit_product_cubit/edit_product_cubit.dart';
import 'package:ecommerce_admin/Widgets/app_bar_for_dashboard.dart';
import 'package:ecommerce_admin/Widgets/edit_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => EditProductCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              AppBarForDashboard(size: size, title: "Edit a product"),
              SizedBox(height: 30),
              EditProductWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
