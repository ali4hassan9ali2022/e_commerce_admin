import 'package:ecommerce_admin/Core/Database/Local/supabase_helper.dart';
import 'package:ecommerce_admin/Core/Helper/cache_helper.dart';
import 'package:ecommerce_admin/Core/Theme/theme_mode.dart';
import 'package:ecommerce_admin/Core/Theme_Cubit/theme_cubit.dart';
import 'package:ecommerce_admin/Core/Theme_Cubit/theme_state.dart';
import 'package:ecommerce_admin/Core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await SupabaseHelper.initSupabase();
  runApp(const EcommerceAdmin());
}

class EcommerceAdmin extends StatelessWidget {
  const EcommerceAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: lightMode(context),
            darkTheme: darkTheme(context),
            themeMode: BlocProvider.of<ThemeCubit>(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            title: "Ecommerce Admin",
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
