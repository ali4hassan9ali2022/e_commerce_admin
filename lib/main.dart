import 'package:ecommerce_admin/Core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcommerceAdmin());
}

class EcommerceAdmin extends StatelessWidget {
  const EcommerceAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Ecommerce Admin",
      routerConfig: AppRouter.router,
    );
  }
}
