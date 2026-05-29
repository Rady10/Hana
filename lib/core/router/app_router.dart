import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/auth_screen.dart';

class AppRouter{
  static var router = GoRouter(
    initialLocation: AuthScreen.routeName,
    routes: [
      GoRoute(
        path: AuthScreen.routeName, 
        builder: (context, state) => const AuthScreen()
      ),
    ]
  );
}