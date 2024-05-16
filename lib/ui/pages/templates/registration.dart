import 'package:flutter/material.dart';

class RegistrationScaffold extends StatelessWidget {
  const RegistrationScaffold({
    super.key,
    this.backgroundImage = const AssetImage('assets/img/backsplash_registration.jpg'),
    required this.form,
    this.height = 0.8,
  });

  final AssetImage backgroundImage;
  final Widget form;
  final double height;

  @override
  Widget build(BuildContext context) {
    assert(height > 0 && height <= 1);

    return Scaffold(body: SafeArea(
      child: Stack(
        alignment: Alignment.bottomCenter,
          children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: backgroundImage,
              fit: BoxFit.fill,
            ),
          ),
          transform: Matrix4.translationValues(0, -100, 0),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.all(20),
            child: form,
          ),
      ]),
    ));
  }
}
