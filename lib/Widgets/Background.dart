import 'package:flutter/material.dart';

class Background extends StatelessWidget{
  const Background({super.key, required this.child});
  final Widget child;

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
              child: child!,
          )
        ],
      )

    );
  }
}