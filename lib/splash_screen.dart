import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'homepage.dart';
import 'login_page.dart';




class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    /*Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>home_page() ));
    });*/
    Future.delayed(Duration(seconds: 8),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_)=>login_page()));
    });
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient:  LinearGradient(colors: [Colors.blue.shade900,Colors.green.shade900],
            begin:Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child:Column(
          children: [
            //SizedBox(height: 40,),
            Center(
                child:Container(
                width: 700,
                height:600,
                child: Image(
                  image: AssetImage('assets/logo_1.png'),
                ),
            ),
            ),
            //SizedBox(height: 10,),
            Container(
              child: SpinKitFoldingCube(
                color: Colors.white,
                size: 50.0,
                duration: const Duration(seconds: 2),
              ),
            )
          ],
        ),
      ),
    );
  }
}