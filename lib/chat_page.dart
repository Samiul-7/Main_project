//import 'dart:js';

import 'package:aust_pharma1/chat_service.dart';
import 'package:aust_pharma1/firebase_auth_implement/firebase_auth_services.dart';
import 'package:aust_pharma1/homepage.dart';
import 'package:aust_pharma1/signup_page.dart';
import 'package:aust_pharma1/usuables/text_field.dart';
import 'package:aust_pharma1/usuables/user_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Main_chat_page.dart';
import 'Test.dart';
import 'Widgets/Background.dart';
import 'admin_page.dart';

class chat_page extends StatelessWidget {
  chat_page({super.key});

  final ChatService _chatService= ChatService();
  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Colors.green,
        actions: [
          ElevatedButton(
            onPressed:
                () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (_)=>home_page()));
            },
            // child: Text('Back',style: TextStyle(fontSize: 15),)
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue[900]), // Change button color
              minimumSize: MaterialStateProperty.all(Size(150, 40)), // Change button size
              padding: MaterialStateProperty.all(EdgeInsets.all(15)), // Adjust internal padding
              textStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Adjust text style
              ),
            ),
            child: Text('Back',
              style: TextStyle(color: Colors.white,fontStyle:FontStyle.italic),
            ),
          ),
        ],
        title:const Text('Chat',style: TextStyle(fontSize: 20),
        ),
      ),
      body:_buildUserList(),
    );
  }
  Widget _buildUserList(){
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            return const Text("Error");
          if(snapshot.connectionState== ConnectionState.waiting)
              return const Text('Loading.....');

            return ListView(
              children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData,context))
                  .toList(),
            );
        }
    );
  }
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    String email = userData["E-mail"] ?? "No Email"; // Use a default value if email is null
    String id= userData["UID"] ?? "No uid";
    if(userData["E-mail"] != _auth.getCurrentUser()!.email){
      return UserTile(
          text: email,
          onTap: () {
            if (id != null && email != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => //Test()
                  Main_chat_page(
                    receiverEmail: email,
                    receiverID: id,
                  ),
                ),
              );
            }
            else{
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Test()
                ),
              );
            }
          }
      );
    }
    else{
      return Container();
    }
  }

}
