import 'package:ecommerce_admin/Views/app_bar_for_dashboard.dart';
import 'package:ecommerce_admin/Widgets/dashboard_widget.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarForDashboard(size: size),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(3, (index) => DashboardWidget()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
