import 'package:ecommerce_admin/Cubit/Search_cubit/search_cubit.dart';
import 'package:ecommerce_admin/Views/dashboard_view.dart';
import 'package:ecommerce_admin/Views/search_view.dart';
import 'package:ecommerce_admin/Views/view_orders_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSearchView = "/kSearchView";
  static const String kViewOrdersView = "/kViewOrdersView";
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => DashboardView()),
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
    ],
  );
}
