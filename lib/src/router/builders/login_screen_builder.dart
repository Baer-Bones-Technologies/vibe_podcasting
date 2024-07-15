import 'package:go_router/go_router.dart';

import '../../../ui/pages/auth/login.dart';

final loginScreenBuilder =  GoRoute(
    path: LoginScreen.routeLocation,
    name: LoginScreen.routeName,
    builder: (_, __) => LoginScreen());