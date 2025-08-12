import 'package:ecommerce_admin/Models/dashboard_model.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key, required this.item});
  final DashboardModel item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.function,

      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(item.imagePath, height: 65, width: 65),
            SizedBox(height: 15),
            Text(item.title, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
