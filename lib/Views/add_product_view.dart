import 'package:ecommerce_admin/Widgets/app_bar_for_dashboard.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20,),
          AppBarForDashboard(size: size, title: "Add a new product")
        ],
      ),
    );
  }
}