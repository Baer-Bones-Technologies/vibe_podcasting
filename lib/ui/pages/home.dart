import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di/providers/auth_provider.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  static String get routeLocation => '/';
  static String get routeName => 'Home';

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _scrollController = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    final authController = ref.read(authManagerProvider);
    final vibeUser = ref.read(vibeUserProvider);

    return Stack(
      children: [
        Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[300],
            child: const Center(
              child: Text('Background'),
            ),
          ),
        ),
        LayoutBuilder(builder: (context, state) {
          return DraggableScrollableSheet(
            key: const Key('draggable_sheet'),
            initialChildSize: 0.5,
            maxChildSize: 0.9,
            minChildSize: 0.1,
            expand: true,
            snap: true,
            controller: _scrollController,
            builder: (context, scrollController) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [

                      Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Center(
                              child: Container(
                                height: 5,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundImage: NetworkImage(vibeUser?.userPreferences.profilePicture ?? ''),
                                  ),
                                  const SizedBox(width: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text('Welcome, '),
                                      Text(vibeUser?.userPreferences.username ?? 'User'),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  authController.signOut(ref);
                                },
                                child: const Text('Sign Out'),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/profile');
                                },
                                child: const Text('Profile'),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/settings');
                                },
                                child: const Text('Settings'),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/about');
                                },
                                child: const Text('About'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ],
    );
  }
}
