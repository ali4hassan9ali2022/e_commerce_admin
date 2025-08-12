import 'package:ecommerce_admin/Views/dashboard_view.dart';
import 'package:ecommerce_admin/Views/search_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSearchView = "kSearchView";
  static final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => DashboardView()),
      GoRoute(path: kSearchView, builder: (context, state) => SearchView()),
    ],
  );
}
