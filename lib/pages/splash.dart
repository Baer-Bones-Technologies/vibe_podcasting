import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  static String get routeLocation => '/splash';
  static String get routeName => 'Splash';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
