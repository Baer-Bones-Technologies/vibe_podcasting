import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/theme_provider.dart';
import '../default_dark_theme.dart';
import '../default_light_theme.dart';

class ThemeExample extends ConsumerStatefulWidget {
  const ThemeExample({super.key});
  static String get routeLocation => '/theme';
  static String get routeName => 'Theme Example';

  @override
  ConsumerState<ThemeExample> createState() => _ThemeExampleState();
}

class _ThemeExampleState extends ConsumerState<ThemeExample> {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier isToggled1 = ValueNotifier(false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Vibe. -- Theme Example'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: (const Text('Primary Button')),
            ),
            TextButton(onPressed: () {}, child: const Text('Secondary Button')),
            OutlinedButton(
                onPressed: () {}, child: const Text('Outlined Button')),
            const Divider(),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Primary Button with Icon')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Secondary Button with Icon')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Outlined Button with Icon')),
            const Divider(),
            Container(
              color: Theme.of(context).primaryColor,
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * .8,
              child: const Center(
                child: Text('Primary Color'),
              ),
            ),
            Text('Header 1', style: Theme.of(context).textTheme.displayLarge),
            Text('Header 2', style: Theme.of(context).textTheme.displayMedium),
            Text('Header 3', style: Theme.of(context).textTheme.displaySmall),
            const Divider(),
            Text('Body 1', style: Theme.of(context).textTheme.bodyLarge),
            Text('Body 2', style: Theme.of(context).textTheme.bodyMedium),
            Text('Body 3', style: Theme.of(context).textTheme.bodySmall),
            const Card(
              child: ListTile(
                title: Text('List Tile'),
                subtitle: Text('List Tile Subtitle'),
                leading: Icon(Icons.list),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Switch(
                    value: isToggled1.value,
                    onChanged: (toggleValue) {
                      isToggled1.value = toggleValue;
                    }),
                Text('This is an error message',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.bold)
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(themeProvider.notifier).state = defaultLightTheme;
                  },
                  child: const Text('Light Theme'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(themeProvider.notifier).state = defaultDarkTheme;
                  },
                  child: const Text('Dark Theme'),
                ),
              ],
            ),

          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ));
  }
}
