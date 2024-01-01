import 'package:go_router/go_router.dart';
import 'package:portfolio/views/home/home.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => const Home(),
    ),
  ],
);
