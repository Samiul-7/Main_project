import 'package:aust_pharma1/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class SuccessPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            const Text(
              'Your order has been successful!',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(onPressed:(){

              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => home_page(),),
              );

            }, child: const Text("Back to Homepage")),
          ],
        ),
      ),
    );
  }
}