import 'package:flutter/material.dart';

class RegistrationScaffold extends StatelessWidget {
  const RegistrationScaffold({
    super.key,
    this.backgroundImage =
        const AssetImage('assets/img/backsplash_registration.jpg'),
    required this.form,
    this.height = 0.8,
    this.backgroundColor,
  });

  final AssetImage backgroundImage;
  final Color? backgroundColor;
  final Widget form;
  final double height;

  @override
  Widget build(BuildContext context) {
    assert(height > 0 && height <= 1);

    return Scaffold(
        body: SafeArea(
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: backgroundImage,
              fit: BoxFit.fill,
            ),
          ),
          transform: Matrix4.translationValues(0, -100, 0),
        ),
        SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * height,
            decoration: BoxDecoration(
              color: backgroundColor ??
                  Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: form,
          ),
        ),
      ]),
    ));
  }
}
