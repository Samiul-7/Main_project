import 'package:flutter/material.dart';

class home_page extends StatelessWidget {
  const home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Colors.green,
        title: Text('AUST Pharma',
            style: TextStyle(
            fontSize: 30,
            color: Colors.white
          )
        ),
      ),

    );
  }
}
