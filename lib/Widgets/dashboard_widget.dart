import 'package:ecommerce_admin/Core/utils/assets.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesWatch, height: 65, width: 65),
            SizedBox(height: 15),
            Text("Title", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
