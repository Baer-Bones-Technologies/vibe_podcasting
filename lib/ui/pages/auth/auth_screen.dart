import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/strings.dart';
import '../../../di/providers/theme_provider.dart';
import '../templates/registration.dart';
import 'login.dart';
import 'register.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});
  static const String routeLocation = '/auth';
  static const String routeName = 'Authenticate';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider.notifier);
    return RegistrationScaffold(
      height: 0.4,
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
