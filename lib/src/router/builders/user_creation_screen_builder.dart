import 'package:go_router/go_router.dart';

import '../../../ui/pages/auth/user_creation.dart';

final userCreationScreenBuilder = GoRoute(
  path: UserCreationScreen.routeLocation,
  name: UserCreationScreen.routeName,
  builder: (_, __) => const UserCreationScreen(),
);