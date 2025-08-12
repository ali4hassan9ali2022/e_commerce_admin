import 'package:ecommerce_admin/Core/utils/app_router.dart';
import 'package:ecommerce_admin/Core/utils/assets.dart';
import 'package:ecommerce_admin/Models/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppHelper {
  static const String kDark = "isDark";
  static bool isDark = false;

  static List<DashboardModel> dashboard(BuildContext context) => [
    DashboardModel(
      title: "Add a new product",
      imagePath: Assets.imagesCloud,
      function: () {},
    ),
    DashboardModel(
      title: "Inspect all products",
      imagePath: Assets.imagesShoppingCart,
      function: () {
        GoRouter.of(context).push(AppRouter.kSearchView);
      },
    ),
    DashboardModel(
      title: "View orders",
      imagePath: Assets.imagesOrder,
      function: () {
        GoRouter.of(context).push(AppRouter.kViewOrdersView);
      },
    ),
  ];
}
