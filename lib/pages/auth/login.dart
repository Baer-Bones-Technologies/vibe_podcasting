import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_podcasting/pages/auth/auth_screen.dart';
import 'package:vibe_podcasting/pages/templates/registration.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  static String get routeLocation => '${AuthScreen.routeLocation}/login';
  static String get routeName => 'Login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RegistrationScaffold(
      form: BackButton(onPressed: () {
        if (context.canPop()) {
          context.pop();
        }
      }),
    );
  }
}
