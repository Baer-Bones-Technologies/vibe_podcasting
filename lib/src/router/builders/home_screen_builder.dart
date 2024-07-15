import 'package:go_router/go_router.dart';

import '../../../ui/pages/home.dart';

final homeScreenBuilder = GoRoute(
path: HomePage.routeLocation,
name: HomePage.routeName,
builder: (_, __) => const HomePage()
);