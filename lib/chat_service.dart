import 'package:aust_pharma1/firebase_auth_implement/firebase_auth_services.dart';
import 'package:aust_pharma1/homepage.dart';
import 'package:aust_pharma1/signup_page.dart';
import 'package:aust_pharma1/usuables/message.dart';
import 'package:aust_pharma1/usuables/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Widgets/Background.dart';
import 'admin_page.dart';

class ChatService{
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;

  // get user stream
  Stream<List<Map<String,dynamic>>> getUserStream(){
    return _firestore.collection('users').snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        final user = doc.data();
        return user;
      }).toList();
    });
  }
  Stream<List<Map<String,dynamic>>> getUserStream_1(){
    return _firestore.collection("Admin").snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //send message
  Future<void>sendMsg(String receiverID,message) async{
    //get current user info
    final String currentUserID=_auth.currentUser!.uid;
    final String cureentUserEmail=_auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //create new msg
    Message newMessage= Message(
        senderID:currentUserID,
        senderEmail: cureentUserEmail,
        receiverId:receiverID,
        message: message,
        timestamp: timestamp,
    );
    //create chat room ID for the two users
    List<String> ids=[currentUserID,receiverID];
    ids.sort();
    String chatRoomID =ids.join('_');
    
    //add new msg to database
    await _firestore
      .collection("chat_room")
      .doc(chatRoomID)
      .collection("messages")
      .add(newMessage.toMap());
  }

  //get message
  Stream<QuerySnapshot> getMessage(String userID, otherUserID){
    List<String> ids=[userID,otherUserID];
    ids.sort();
    String chatRoomID=ids.join('_');
    return _firestore
        .collection("chat_room")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp",descending: false)
        .snapshots();
  }
}