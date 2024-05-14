import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_podcasting/pages/templates/registration.dart';

import 'auth_screen.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  static String get routeLocation => '${AuthScreen.routeLocation}/register';
  static String get routeName => 'Register';

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
