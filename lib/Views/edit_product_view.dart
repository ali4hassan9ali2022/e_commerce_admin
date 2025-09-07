import 'package:ecommerce_admin/Models/product_model.dart';
import 'package:ecommerce_admin/Widgets/app_bar_for_dashboard.dart';
import 'package:ecommerce_admin/Widgets/custom_bottom_sheet_for_edit_product.dart';
import 'package:ecommerce_admin/Widgets/edit_product_widget.dart';
import 'package:flutter/material.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: CustomBottomSheetForEditProduct(
        productId: product.productId,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            AppBarForDashboard(size: size, title: "Edit a product"),
            SizedBox(height: 30),
            EditProductWidget(productId: product.productId),
          ],
        ),
      ),
    );
  }
}
