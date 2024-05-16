import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_podcasting/ui/pages/camera/camera_preview.dart';
import 'package:vibe_podcasting/ui/pages/home.dart';

import '../../providers/auth_provider.dart';
import '../../providers/camera_providers.dart';
import 'auth_screen.dart';

class UserCreationScreen extends ConsumerStatefulWidget {
  const UserCreationScreen({super.key});

  static const routeName = 'User Creation';
  static const routeLocation = '${AuthScreen.routeLocation}/user_creation';

  @override
  ConsumerState createState() => _UserCreationScreenState();
}

class _UserCreationScreenState extends ConsumerState<UserCreationScreen> {
  @override
  Widget build(BuildContext context) {
    final authController = ref.read(authManagerProvider);
    final firebaseAuth = ref.read(firebaseAuthProvider);
    final imagePreview = ref.read(previewImageProvider);
    final over13 = ref.watch(over13Provider);

    final usernameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            authController.signOut(ref);
            context.go(AuthScreen.routeLocation);
          },
        ),
        title: const Text(UserCreationScreen.routeName),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Tell us about yourself!'),
            GestureDetector(
              onTap: () {
                context.push(CameraPreview.routeLocation,
                    extra: UserCreationScreen.routeLocation);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      const AssetImage('assets/img/avi_default.png'),
                  foregroundImage: imagePreview != null
                      ? FileImage(File(imagePreview.path))
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 42),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                    value: over13,
                    onChanged: (value) {
                      //ignore: avoid_print
                      print(value);
                      ref.read(over13Provider.notifier).state = value!;
                      usernameController.value =
                          usernameController.value.copyWith(
                        text: usernameController.value.text,
                      );
                    }),
                const Text('I am over 13 years old'),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                final username = usernameController.value.text;
                try {
                  await authController
                      .createVibeUserFile(
                        firebaseAuth.currentUser,
                        photoUri: imagePreview,
                        over13: over13,
                        username: username,
                      )
                      .then((value) => {
                            if (value != null)
                              {
                                ref.read(vibeUserProvider.notifier).state =
                                    value,
                                context.go(HomePage.routeLocation),
                              }
                          });
                } catch (e) {
                  if (kDebugMode) {
                    print(e);
                  }
                }
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}

final over13Provider = StateProvider<bool>((ref) => false);
