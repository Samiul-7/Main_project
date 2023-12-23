import 'package:aust_pharma1/homepage.dart';
import 'package:aust_pharma1/signup_page.dart';
import 'package:aust_pharma1/usuables/text_field.dart';
import 'package:flutter/material.dart';

import 'Widgets/Background.dart';

class login_page extends StatelessWidget {
  login_page({super.key});

  final username_controller=TextEditingController();
  final pass_controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Background(

     child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:25),
            //////////////////////////////////////////logo
            Center(
              child: Icon(
                Icons.medical_services,
                size: 100,
              ),
            ),
            SizedBox(height: 20,),

            ////////////////////////////////////////////////Welcome
            Text('Welcome User ! We are at your service!',
              style: TextStyle(color: Colors.grey[700],fontSize: 20,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),

            //////////////////////////////////////////////////username

            my_text_field(
              controller:username_controller,
              hintText: 'Username',
              obscureText: false,
            ),

            SizedBox(height: 10,),

            //////////////////////////////////////////////////password

            my_text_field(
              controller: pass_controller,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 20,),

            ////////////////////////////////////////////////sign in buttom

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SizedBox(width:100,),
                  ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_)=>home_page()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black), // Change button color
                    minimumSize: MaterialStateProperty.all(Size(150, 40)), // Change button size
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)), // Adjust internal padding
                    textStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Adjust text style
                    ),
                  ),
                  child: Text('Sign In',
                    style: TextStyle(color: Colors.white,fontStyle:FontStyle.italic),
                  ),
                ),
                  SizedBox(width: 100,),
                ]
              ),
            ),
            SizedBox(height: 50,),

            //////////////////////////////////////////////or continue with
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                      child: Divider(
                        thickness: 2.5,
                        color: Colors.grey[900],
                      ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700],fontSize: 20),
                      ),
                  ),
                  Expanded(
                      child:Divider(
                        thickness: 2.5,
                        color: Colors.grey[900],
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            //////////////////////////////////////////////facebook + apple design
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: InkWell(
                    child: Image(
                      image: AssetImage('assets/facebook.png'),
                    ),
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_)=>home_page()));
                    },
                  ),

                ),
                Container(
                  height: 30,
                  width: 30,
                  child: InkWell(
                    child: Image(
                      image: AssetImage('assets/twitter.png'),
                    ),
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_)=>home_page()));
                    },
                  ),

                ),
                Container(
                  height: 30,
                  width: 30,
                  child: InkWell(
                    child: Image(
                      image: AssetImage('assets/google.png'),
                    ),
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_)=>home_page()));
                    },
                  ),

                ),
                Container(
                  height: 30,
                  width: 30,
                  child: InkWell(
                    child: Image(
                      image: AssetImage('assets/github.png'),
                    ),
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_)=>home_page()));
                    },
                  ),

                )
              ],
            ),

            SizedBox(height: 50,),
            ////////////////////////////////////////////not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member?',
                style: TextStyle(color: Colors.grey.shade900,fontSize: 20),
                ),
                SizedBox(width:10,),
                GestureDetector(
                  child: Text('Register Now',
                    style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_)=>signup_page()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );;
  }
}

