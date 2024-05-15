import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibe_podcasting/pages/templates/registration.dart';

import 'auth_screen.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  static String get routeLocation => '${AuthScreen.routeLocation}/register';
  static String get routeName => 'Register';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    registrationScreen({Map<String, dynamic>? args}) =>
        ref.watch(registrationScreenProvider(args: args));

    return RegistrationScaffold(
        form: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Register',
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.displayLarge,
                color: Colors.black)),
        Text(
          'Create an account to get started',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 32),
        registrationScreen(args: {
          'onSubmit': () {},
        })
      ],
    ));
  }
}

registrationScreenProvider({Map<String, dynamic>? args}) =>
    Provider<Widget>((ref) => initialRegistrationScreen(ref,
        onSubmit: args?['onSubmit'] as void Function()));

Widget initialRegistrationScreen(ProviderRef ref, {Function? onSubmit}) {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: double.infinity,
        child: TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      const SizedBox(height: 16),
      SizedBox(
        width: double.infinity,
        child: TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      const SizedBox(height: 16),
      SizedBox(
        width: double.infinity,
        child: TextField(
          controller: confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      const SizedBox(height: 16),
      ElevatedButton(
        onPressed: onSubmit as void Function()? ?? () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
        child: const Text('Register'),
      ),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text('Already have an account?'),
          TextButton(
            onPressed: () {},
            child: const Text('Login'),
          ),
        ],
      ),
      const SizedBox(height: 16),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
            indent: 0,
            endIndent: 0,
          ),
          Text('OR'),
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
            indent: 0,
            endIndent: 0,
          ),
        ],
      ),
      const SizedBox(height: 16),
      OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(
              const Size(
                double.infinity,
                50,
              ),
            ),
          ),
          child: const Text('Sign up with Google')),
      const SizedBox(height: 16),
      OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(
              const Size(
                double.infinity,
                50,
              ),
            ),
          ),
          child: const Text('Sign up with Facebook'))
    ],
  );
}
