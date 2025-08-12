import 'package:ecommerce_admin/Core/Theme_Cubit/theme_cubit.dart';
import 'package:ecommerce_admin/Core/Theme_Cubit/theme_state.dart';
import 'package:ecommerce_admin/Core/utils/assets.dart';
import 'package:ecommerce_admin/Widgets/app_shimmer%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarForDashboard extends StatelessWidget {
  const AppBarForDashboard({super.key, required this.size, required this.title,this.isShow = false});
  final bool? isShow;
  final Size size;
  final String title;
  @override
  Widget build(BuildContext context) {
    var theme = BlocProvider.of<ThemeCubit>(context);
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
          ShimmerText(text: title),
          Spacer(),
        isShow == true ?   BlocConsumer<ThemeCubit, ThemeState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  theme.chanageTheme();
                },
                icon: Icon(
                  theme.isDark ? Icons.dark_mode : Icons.light_mode,
                  size: 35,
                ),
              );
            },
          ) : SizedBox(),
        ],
      ),
    );
  }
}
