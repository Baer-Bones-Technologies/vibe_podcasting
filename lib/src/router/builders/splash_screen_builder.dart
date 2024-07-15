import 'package:go_router/go_router.dart';

import '../../../ui/pages/splash.dart';

final splashScreenBuilder = GoRoute(
  path: SplashScreen.routeLocation,
  name: SplashScreen.routeName,
  builder: (_, __) => const SplashScreen(),
);