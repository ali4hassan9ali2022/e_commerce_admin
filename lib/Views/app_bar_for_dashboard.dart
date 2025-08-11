import 'package:ecommerce_admin/Core/utils/assets.dart';
import 'package:ecommerce_admin/Widgets/app_shimmer%20.dart';
import 'package:flutter/material.dart';

class AppBarForDashboard extends StatelessWidget {
  const AppBarForDashboard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        children: [
          Image.asset(
            Assets.imagesShoppingCart,
            width: size.width * 0.15,
            height: size.width * 0.15,
          ),
          SizedBox(width: 16),
          ShimmerText(text: "ShopSmart"),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.light_mode, size: 35),
          ),
        ],
      ),
    );
  }
}
