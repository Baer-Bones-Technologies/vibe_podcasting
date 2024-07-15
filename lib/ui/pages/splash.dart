import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_podcasting/constants/models/vibe_user.dart';
import 'package:vibe_podcasting/ui/pages/auth/auth_screen.dart';
import 'package:vibe_podcasting/ui/pages/auth/user_creation.dart';

import '../../di/providers/auth_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  static String get routeLocation => '/splash';

  static String get routeName => 'Splash';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authManager = ref.read(authManagerProvider);

    //Delay for 5 Seconds and reroute
    Future.delayed(const Duration(seconds: 5), () async {
      if (authManager.currentUser != null) {
        ref.read(vibeUserProvider.notifier).state = await VibeUser.getUser(
            ref.read(firebaseAuthProvider).currentUser?.uid);
        if (context.mounted &&
            ref.read(vibeUserProvider.notifier).state != null) {
          context.go('/home');
        } else {
          if (context.mounted) {
            context.go(UserCreationScreen.routeLocation);
          }
        }
      } else {
        context.go(AuthScreen.routeLocation);
      }
    });

    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (context.mounted)
              Text('Vibe', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
