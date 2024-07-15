import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../ui/pages/splash.dart';
import 'builders/auth_choice_screen_builder.dart';
import 'builders/camera_preview_screen_builder.dart';
import 'builders/home_screen_builder.dart';
import 'builders/login_screen_builder.dart';
import 'builders/photo_preview_builder.dart';
import 'builders/register_screen_builder.dart';
import 'builders/splash_screen_builder.dart';
import 'builders/user_creation_screen_builder.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {


  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: SplashScreen.routeLocation,
    routes: [
      splashScreenBuilder,
      homeScreenBuilder,
      authScreenBuilder,
      loginScreenBuilder,
      registerScreenBuilder,
      userCreationScreenBuilder,
      cameraPreviewScreenBuilder,
      photoPreviewScreenBuilder,
    ],
  );
});
