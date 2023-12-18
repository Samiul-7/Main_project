import 'package:animated_switch/animated_switch.dart';
import 'package:aust_pharma1/Widgets/Background.dart';
import 'package:aust_pharma1/login_page.dart';
import 'package:aust_pharma1/usuables/text_field.dart';
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
  @override
  final pass_control=TextEditingController();

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
                      child: InkWell(
                        child: Text('Aust Pharma',style:
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 30,

                          ),),
                        onTap: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (_)=>home_page()));
                        },
                      )
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
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
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
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: TextFormField(
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
                                      validator: (value){
                                        if(value== null|| value.isEmpty)
                                        {
                                          return 'Please enter email';
                                        }
                                        return null;
                                      },
                                      controller: pass_control,
                                      obscureText: true,


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
                                      onPressed: () {
                                        if (_formSignupKey.currentState!.validate() &&
                                            agreePersonalData) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Processing Data'),
                                            ),
                                          );
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


                                ],
                              ),
                            ),
                          )
                        ],
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
}
