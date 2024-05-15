import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';

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

  return Stack(
      children:[
        Scaffold(
          appBar: AppBar(
            title: Text(HomePage.routeName),
            actions: [
              IconButton(onPressed: (){
                authController.signOut(ref);
              },
              icon: const Icon(Icons.logout_outlined,)),
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: const Center(
              child: Text('Background'),
            ),
          ),
        ),
        LayoutBuilder(builder: (context, state) {
        return DraggableScrollableSheet(
          controller: _scrollController,
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight:  Radius.circular(25))
                ),
                child: const Center(child:  Text('Foreground')),
                ),
            );
          },
        );
      }),
    ],
    );
  }
}
