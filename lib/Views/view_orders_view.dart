import 'package:ecommerce_admin/Widgets/app_bar_for_dashboard.dart';
import 'package:ecommerce_admin/Widgets/custom_orders_widget.dart';
import 'package:flutter/material.dart';

class ViewOrdersView extends StatelessWidget {
  const ViewOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          AppBarForDashboard(size: size, title: "View orders"),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => CustomOrdersWidget(),
              separatorBuilder: (context, index) => Divider(),
              itemCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
