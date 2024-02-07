import 'package:animated_switch/animated_switch.dart';
import 'package:aust_pharma1/Widgets/Background.dart';
import 'package:aust_pharma1/firebase_auth_implement/firebase_auth_services.dart';
import 'package:aust_pharma1/login_page.dart';
import 'package:aust_pharma1/usuables/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('AdminPage',style: TextStyle(fontSize: 20),),
      ),
      body:Container(
        child: Text(''),
      ),
    );
  }
}
