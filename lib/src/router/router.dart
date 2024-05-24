import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_podcasting/ui/pages/camera/camera_preview.dart';
import 'package:vibe_podcasting/ui/pages/camera/photo_preview.dart';

import '../../ui/pages/auth/auth_screen.dart';
import '../../ui/pages/auth/login.dart';
import '../../ui/pages/auth/register.dart';
import '../../ui/pages/auth/user_creation.dart';
import '../../ui/pages/home.dart';
import '../../ui/pages/splash.dart';
import '../../ui/themes/pages/example.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {

  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: SplashScreen.routeLocation,
    routes: [
      GoRoute(
        path: SplashScreen.routeLocation,
        name: SplashScreen.routeName,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: HomePage.routeLocation,
        name: HomePage.routeName,
        builder: (_, __) => const HomePage(),
      ),
      GoRoute(
        path: AuthScreen.routeLocation,
        name: AuthScreen.routeName,
        builder: (_, __) => const AuthScreen(),
      ),
      GoRoute(
        path: ThemeExample.routeLocation,
        name: ThemeExample.routeName,
        builder: (_, __) => const ThemeExample(),
      ),
      GoRoute(
          path: LoginScreen.routeLocation,
          name: LoginScreen.routeName,
          builder: (_, __) => LoginScreen()),
      GoRoute(
          path: RegisterScreen.routeLocation,
          name: RegisterScreen.routeName,
          builder: (_, __) => RegisterScreen()),
      GoRoute(
        path: UserCreationScreen.routeLocation,
        name: UserCreationScreen.routeName,
        builder: (_, __) => const UserCreationScreen(),
      ),
      GoRoute(
        path: CameraPreview.routeLocation,
        name: CameraPreview.routeName,
        builder: (_, state) => CameraPreview(
          returnPath: state.extra as String,
        ),
      ),
      GoRoute(
          path: PhotoPreview.routeLocation,
          name: PhotoPreview.routeName,
          builder: (_, state) => PhotoPreview(
                returnPath: state.extra as String,
              )),
    ],
  );
});
