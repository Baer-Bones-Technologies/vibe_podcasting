import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/strings.dart';
import '../../providers/auth_provider.dart';
import '../templates/registration.dart';
import 'auth_screen.dart';
import 'register.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  static String get routeLocation => '${AuthScreen.routeLocation}/login';
  static String get routeName => 'Login';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authManagerProvider);

    return SingleChildScrollView(
      controller: ScrollController()
        ..addListener(() => FocusScope.of(context).unfocus()),
      child: RegistrationScaffold(
          form: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(loginLabel,
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  color: Colors.black)),
          Text(
            loginTagLine,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: _emailController,
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
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              controller: _passwordController,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  context.push(AuthScreen.routeLocation);
                },
                child: const Text('Forgot Password?'),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  final email = _emailController.value.text;
                  final password = _passwordController.value.text;
                  try {
                    authController.signInWithEmailAndPassword(
                        email: email, password: password);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width * 0.8,
                      50,
                    ),
                  ),
                ),
                child: const Text(loginLabel),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      thickness: 2,
                      color: Colors.blue,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Text(
                      'or',
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.blue,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(
                      Size(
                        MediaQuery.of(context).size.width * 0.8,
                        50,
                      ),
                    ),
                  ),
                  child: const Text('Sign in with Google')),
              const SizedBox(height: 16),
              OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(
                      Size(
                        MediaQuery.of(context).size.width * 0.8,
                        50,
                      ),
                    ),
                  ),
                  child: const Text('Sign in with Facebook'))
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account?'),
              TextButton(
                onPressed: () {
                  context.push(RegisterScreen.routeLocation);
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
