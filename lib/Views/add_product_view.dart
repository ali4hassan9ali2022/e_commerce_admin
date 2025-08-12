import 'package:ecommerce_admin/Widgets/add_product_widget.dart';
import 'package:ecommerce_admin/Widgets/app_bar_for_dashboard.dart';
import 'package:ecommerce_admin/Widgets/custom_bottom_sheet_fot_add_product.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: CustomBottomSheetFotAddProduct(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            AppBarForDashboard(size: size, title: "Add a new product"),
            SizedBox(height: 30),
            AddProductWidget(),
          ],
        ),
      ),
    );
  }
}

