//import 'dart:js';

import 'package:aust_pharma1/chat_service.dart';
import 'package:aust_pharma1/firebase_auth_implement/firebase_auth_services.dart';
import 'package:aust_pharma1/homepage.dart';
import 'package:aust_pharma1/signup_page.dart';
import 'package:aust_pharma1/usuables/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UserTile({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amberAccent.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(Icons.person),
            const SizedBox(width: 20,),
            Text(text,style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}


