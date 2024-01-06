
import 'package:aust_pharma1/firebase_auth_implement/firebase_auth_services.dart';
import 'package:aust_pharma1/homepage.dart';
import 'package:aust_pharma1/signup_page.dart';
import 'package:aust_pharma1/usuables/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Widgets/Background.dart';

class login_page extends StatefulWidget {
  login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  ///////////////////////////////////////////////////////

  final FirebaseAuthService _auth = FirebaseAuthService();

  //////////////////////////////////////////////////////

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
                  onPressed:_signIn,
                  //     () {
                  //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //       builder: (_)=>home_page()));
                  // },
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
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sign in as a',
                  style: TextStyle(color: Colors.grey.shade900,fontSize: 20),
                ),
                SizedBox(width:10,),
                GestureDetector(
                  child: Text('Guest !',
                    style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (_)=>home_page()));
                  },
                ),
              ],
            ),
          ],

        ),
      ),
    );;
  }

  /////////////////////////////////////////////////////////////////////
    void _signIn() async{
      String email=username_controller.text;
      String password= pass_controller.text;

      User? user =await _auth.signInWithEmailAndPassword(email, password);

      if(user!= null){
        print("Successfully logged in");

        Navigator.push(context,MaterialPageRoute(builder: (context) => home_page()));
      }
      else{
        print("Some error Occured");
      }
    }
    //////////////////////////////////////////////////////////////////
}

