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
import '../../ui/providers/auth_provider.dart';
import '../../ui/themes/pages/example.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  final vibeUserState = ref.watch(vibeUserProvider);
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
    redirect: (context, state) {
      /// if the authentication state is loading or has an error, return null, if over a certain time, redirect to error page
      if (authState.isLoading || authState.hasError) return null;

      final isAuth = authState.valueOrNull != null;
      final isVibeAuth = vibeUserState != null;

      final isSplash = state.matchedLocation == SplashScreen.routeLocation;
      final isRegister = state.matchedLocation == RegisterScreen.routeLocation;

      if (isSplash) {
        return isVibeAuth ? HomePage.routeLocation : AuthScreen.routeLocation;
      }

      if (isRegister) {
        return isAuth ? UserCreationScreen.routeLocation : null;
      }
      return null;
    },
  );
});
