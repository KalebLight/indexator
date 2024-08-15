import 'package:go_router/go_router.dart';
import 'package:indexator/app/modules/auth/pages/init_page.dart';
import 'package:indexator/app/modules/auth/pages/login_page.dart';
import 'package:indexator/app/modules/auth/pages/sign_in_page.dart';
import 'package:indexator/app/modules/home/pages/home_page.dart';

final routes = GoRouter(
  initialLocation: '/init-page',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/init-page',
      builder: (context, state) => const InitPage(),
    ),
  ],
);
