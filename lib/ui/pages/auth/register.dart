import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../di/providers/auth_provider.dart';
import '../templates/registration.dart';
import 'auth_screen.dart';
import 'login.dart';
import 'user_creation.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key, required this.onEmailSubmitted, required this.onPasswordSubmitted, required this.onVerifyPasswordChanged});



  static const String routeLocation = '${AuthScreen.routeLocation}/register';
  static const String routeName = 'Register';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final Function(String) onEmailSubmitted;
  final Function(String) onPasswordSubmitted;
  final Function(String) onVerifyPasswordChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authManagerProvider);
    final errorMessage = ValueNotifier('');

    return RegistrationScaffold(
      form: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Register',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.displayLarge,
                color: Theme.of(context).colorScheme.onPrimary,
              )),
          Text(
            'Create an account to get started',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Visibility(
            visible: errorMessage.value.isNotEmpty,
            child: Text(errorMessage.value,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.red,
                    )),
          ),
          const SizedBox(height: 32),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSubmitted: onEmailSubmitted,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSubmitted: onPasswordSubmitted,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  onChanged: onVerifyPasswordChanged,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await authController.signUpWithEmailAndPassword(
                      _emailController.text,
                      _passwordController.text,
                      _confirmPasswordController.text,
                    ).then((value) => context.mounted && value != null ?
                      context.push(
                        UserCreationScreen.routeLocation,
                      ) : throw Exception('Technical Error'));
                    } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).colorScheme.error,
                          content: Text(
                            e.toString(),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                            )
                          ),
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ),
                ),
                child: const Text(
                  'Register',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Already have an account?',
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(
                        LoginScreen.routeLocation,
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                    ),
                    )
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
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
                  Text(
                    'OR',
                  ),
                  Divider(
                    color: Colors.black,
                    height: 20,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
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
                  child: const Text(
                    'Sign up with Google',
                  )),
              const SizedBox(
                height: 16,
              ),
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
                  child: const Text(
                    'Sign up with Facebook',
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
