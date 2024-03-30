import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash_background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Image.asset('assets/logo_pokedex2.png'),
      ),
    );
  }
}
