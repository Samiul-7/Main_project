import 'package:animated_switch/animated_switch.dart';
import 'package:aust_pharma1/Widgets/Background.dart';
import 'package:aust_pharma1/firebase_auth_implement/firebase_auth_services.dart';
import 'package:aust_pharma1/login_page.dart';
import 'package:aust_pharma1/usuables/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Theme/Theme.dart';
import 'homepage.dart';

class signup_page extends StatefulWidget {
  const signup_page({super.key});

  @override
  State<signup_page> createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<signup_page>{
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;
  ///////////////////////////////////////////////////////

  final FirebaseAuthService _auth = FirebaseAuthService();

  
  //////////////////////////////////////////////////////
  @override
  final email_control=TextEditingController();
  final pass_control=TextEditingController();
  final address_control=TextEditingController();
  final name_control=TextEditingController();

  Widget build(BuildContext context){
    return Background(




      child: Stack(
        children: [
          IconButton(
            icon:Icon(Icons.arrow_back_ios_new_rounded),
            color: Colors.red,
            iconSize: 30,
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (_)=>login_page()));
            },
          ),

          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                    child: Container(
                        child: Text('Aust Pharma',style:
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                            fontSize: 30,
                          ),),
                    )),
                SizedBox(height: 10,),

                Expanded(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formSignupKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Sign Up',style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                                
                                                
                                ),),
                                SizedBox(height: 10,),
                               Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: TextFormField(
                                    controller: name_control,
                                    validator: (value){
                                      if(value== null|| value.isEmpty)
                                      {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                                
                                    decoration: InputDecoration(
                                      labelText: 'Full Name',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                                
                                      ),
                                      fillColor: Colors.redAccent,
                                      filled: true,
                                                
                                      hintText: 'Full Name',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: TextFormField(
                                    controller: email_control,
                                    validator: (value){
                                      if(value== null|| value.isEmpty)
                                        {
                                          return 'Please enter email';
                                        }
                                      return null;
                                                },
                                                
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                                
                                      ),
                                      fillColor: Colors.redAccent,
                                      filled: true,
                                                
                                      hintText: 'Email Adress',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: TextFormField(
                                    controller: address_control,
                                    validator: (value){
                                      if(value== null|| value.isEmpty)
                                      {
                                        return 'Please enter Address';
                                      }
                                      return null;
                                    },

                                    decoration: InputDecoration(
                                      labelText: 'Address',
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,

                                      ),
                                      fillColor: Colors.redAccent,
                                      filled: true,

                                      hintText: 'Address',
                                    ),
                                  ),
                                ),
                                Padding(
                                                
                                  padding: const EdgeInsets.all(15.0),
                                  child: TextFormField(
                                    controller: pass_control,
                                    obscureText: true,
                                    validator: (value){
                                      if(value== null|| value.isEmpty)
                                      {
                                        return 'Please enter email';
                                      }
                                      return null;
                                    },

                                                
                                                
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      suffixIcon: Icon(Icons.visibility_off),
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                                
                                      ),
                                      fillColor: Colors.redAccent,
                                      filled: true,
                                      hintText: 'Input Password',
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: agreePersonalData,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          agreePersonalData = value!;
                                        });
                                      },
                                      activeColor: lightColorScheme.primary,
                                    ),
                                    const Text(
                                      'I agree to the processing of ',
                                      style: TextStyle(
                                        color: Colors.black45,
                                      ),
                                    ),
                                    Text(
                                      'Personal data',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: lightColorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25.0,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed:

                                        () {
                                      if (_formSignupKey.currentState!.validate() &&
                                           agreePersonalData) {
                                        _signUp();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                           const SnackBar(
                                            content: Text('Processing Data'),
                                           ),
                                         );
                                         print("Validation is Done");
                                      } else if (!agreePersonalData) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Please agree to the processing of personal data')),
                                        );
                                      }
                                    },

                                    child: const Text('Sign up'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                // sign up divider
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.7,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 0,
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        'Sign up with',
                                        style: TextStyle(
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.7,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
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
                                                
                                                
                              ],
                            ),
                          ),
                        ),
                      ),

                    ),
                  ),

                )

              ],
            ) ,

          )
        ],
      )
    );
  }
  ///////////////////////////////////////////////////
  void _signUp() async {
    String name= name_control.text;
    String email=email_control.text;
    String pass=pass_control.text;
    String address=address_control.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, pass);
    
    if (user!=Null){
      print("User successfully created");
      userdetail(
          name_control.text.trim(),
          address_control.text.trim(),
          email_control.text.trim(),
          pass_control.text.trim(),

      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //       const SnackBar(
      //         content: Text('Welcome User'),
      //       ),
      //     );
      Navigator.push(context,MaterialPageRoute(builder: (context) => home_page()));
    }
    else{
      print("Some error happened");
    }
    
  }
  Future userdetail(String name,String address,String email,String password) async{
    await FirebaseFirestore.instance.collection('users').add({
      'Name' : name,
      'Address' : address,
      'E-mail' : email,
      'Password' : password,
    });
  }
  /////////////////////////////////////////////////////
}
