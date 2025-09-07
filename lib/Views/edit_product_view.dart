import 'package:ecommerce_admin/Widgets/app_bar_for_dashboard.dart';
import 'package:ecommerce_admin/Widgets/custom_bottom_sheet_for_edit_product.dart';
import 'package:ecommerce_admin/Widgets/edit_product_widget.dart';
import 'package:flutter/material.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: CustomBottomSheetForEditProduct(),
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
    );
  }
}
