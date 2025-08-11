import 'package:ecommerce_admin/Core/Helper/cache_helper.dart';
import 'package:ecommerce_admin/Core/utils/app_router.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
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
