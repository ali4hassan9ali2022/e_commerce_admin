import 'package:ecommerce_admin/Widgets/add_product_widget.dart';
import 'package:ecommerce_admin/Widgets/app_bar_for_dashboard.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                label: Text(
                  "Clear",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                icon: Icon(Icons.clear, size: 22, color: Colors.white),
              ),
            ),
            Expanded(flex: 1, child: SizedBox(width: 5)),
            Expanded(
              flex: 5,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                label: Text(
                  "Upload product",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                icon: Icon(Icons.upload, size: 22, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
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
