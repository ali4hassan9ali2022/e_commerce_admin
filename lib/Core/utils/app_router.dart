import 'package:ecommerce_admin/Core/Database/Network/supabase_helper.dart';
import 'package:ecommerce_admin/Cubit/Search_cubit/search_cubit.dart';
import 'package:ecommerce_admin/Cubit/add_product_cubit/add_product_cubit.dart';
import 'package:ecommerce_admin/Views/add_product_view.dart';
import 'package:ecommerce_admin/Views/dashboard_view.dart';
import 'package:ecommerce_admin/Views/log_in_view.dart';
import 'package:ecommerce_admin/Views/register_view.dart';
import 'package:ecommerce_admin/Views/search_view.dart';
import 'package:ecommerce_admin/Views/view_orders_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSearchView = "/kSearchView";
  static const String kViewOrdersView = "/kViewOrdersView";
  static const String kAddProductView = "/kAddProductView";
  static const String kDashboardView = "/kDashboardView";
  static const String kRegisterView = "/kRegisterView";
  static const kSignInView = "/SignInView";
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => LogInView()),
      GoRoute(
        path: kDashboardView,
        builder: (context, state) => DashboardView(),
      ),
      GoRoute(path: kRegisterView, builder: (context, state) => RegisterView()),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(),
          child: SearchView(),
        ),
      ),
      GoRoute(
        path: kViewOrdersView,
        builder: (context, state) => ViewOrdersView(),
      ),
      GoRoute(
        path: kAddProductView,
        builder: (context, state) => BlocProvider(
          create: (context) => AddProductCubit(),
          child: AddProductView(),
        ),
      ),
    ],
    redirect: (context, state) {
      final user = SupabaseHelper.supabase.auth.currentUser;
      final bool isLoggedIn = user != null;
      final bool isLoggingIn = state.uri.toString() == '/';
      // if (Constants.isGuest) {
      //   return null;
      // }
      if (isLoggedIn) {
        if (isLoggingIn) {
          return kDashboardView;
        }
        return null;
      } else {
        if (!isLoggingIn && state.uri.toString() != kRegisterView) {
          return '/';
        }
        return null;
      }
    },
  );
}
