import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibe_podcasting/constants/strings.dart';

import 'config/initialize_application.dart';
import 'di/providers/theme_provider.dart';
import 'src/router/router.dart';

void main() async {
  await runZonedGuarded(() async {
    await Bootstrapper().initialize().then((container) =>
        runApp(
          UncontrolledProviderScope(
            container: container,
            child: const AppRunner(),
          ),
        ),
    );
  }, (error, stackTrace) {
    if (kDebugMode) {
      print(runGuardedError);
    }
  });
}

class AppRunner extends ConsumerWidget{
  const AppRunner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final theme = ref.watch(themeProvider);

    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      title: appName,
      theme: theme,
    );
  }
}