import 'package:ecommerce_admin/Views/app_bar_for_dashboard.dart';
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
          ],
        ),
      ),
    );
  }
}

