import 'package:go_router/go_router.dart';

import '../../../ui/pages/auth/auth_screen.dart';

final authScreenBuilder = GoRoute(
  path: AuthScreen.routeLocation,
  name: AuthScreen.routeName,
  builder: (_, __) => const AuthScreen(),
);