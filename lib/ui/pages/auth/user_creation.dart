import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/auth_provider.dart';
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
    final vibeUserController = ref.read(vibeUserProvider);
    final authController = ref.read(authManagerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => authController.signOut(ref),
        ),
        title: const Text(UserCreationScreen.routeName),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Tell us about yourself!'),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                      radius: 50,
                      backgroundImage: const AssetImage('assets/img/avi_default.png'),
                      foregroundImage: NetworkImage(
                          vibeUserController?.userPreferences.profilePicture ?? ''),
                    ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
