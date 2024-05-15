import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_podcasting/pages/auth/auth_screen.dart';
import 'package:vibe_podcasting/pages/auth/login.dart';
import 'package:vibe_podcasting/pages/auth/register.dart';
import 'package:vibe_podcasting/pages/home.dart';
import 'package:vibe_podcasting/themes/pages/example.dart';

import '../pages/splash.dart';
import '../providers/auth_provider.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
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
          builder: (_, __) => const RegisterScreen()),
    ],
    redirect: (context, state) {
      /// if the authentication state is loading or has an error, return null, if over a certain time, redirect to error page
      if (authState.isLoading || authState.hasError) return null;

      final isAuth = authState.valueOrNull != null;

      final isSplash = state.matchedLocation == SplashScreen.routeLocation;
      final isAuthScreen = state.matchedLocation == AuthScreen.routeLocation;
      final isLoginScreen = state.matchedLocation == LoginScreen.routeLocation;
      final isRegisterScreen =
          state.matchedLocation == RegisterScreen.routeLocation;

      if (isSplash) {
        return isAuth ? HomePage.routeLocation : AuthScreen.routeLocation;
      }

      if (isAuthScreen) {
        return isAuth
            ? HomePage.routeLocation
            : isLoginScreen
                ? LoginScreen.routeLocation
                : isRegisterScreen
                    ? RegisterScreen.routeLocation
                    : AuthScreen.routeLocation;
      }

      return isAuth || isLoginScreen || isRegisterScreen
          ? null
          : SplashScreen.routeLocation;
    },
  );
});
