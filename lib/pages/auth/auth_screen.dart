import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_podcasting/pages/auth/register.dart';
import 'package:vibe_podcasting/pages/templates/registration.dart';
import 'package:vibe_podcasting/providers/theme_provider.dart';

import '../../constants/strings.dart';
import 'login.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});
  static String get routeLocation => '/auth';
  static String get routeName => 'Authenticate';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider.notifier);
    return RegistrationScaffold(
        form: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Vibe.',
              style: themeData.state.textTheme.displayLarge,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(authScreenTagLine,
              style: themeData.state.textTheme.bodySmall),
        ),
        const Spacer(),
        ElevatedButton(
            onPressed: () {
              context.push(LoginScreen.routeLocation);
            },
            style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(Size(
              MediaQuery.of(context).size.width * 0.8,
              50,
            ))),
            child: const Text(loginLabel)),
        const SizedBox(height: 16),
        OutlinedButton(
            onPressed: () {
              context.push(RegisterScreen.routeLocation);
            },
            style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(Size(
              MediaQuery.of(context).size.width * 0.8,
              50,
            ))),
            child: const Text(registerLabel)),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {},
          child: Text('Forgot Password?',
              style: themeData.state.textTheme.bodySmall),
        ),
      ],
    ));
  }
}
