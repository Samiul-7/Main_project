import 'package:aust_pharma1/chat_service.dart';
import 'package:aust_pharma1/firebase_auth_implement/firebase_auth_services.dart';
import 'package:aust_pharma1/homepage.dart';
import 'package:aust_pharma1/signup_page.dart';
import 'package:aust_pharma1/usuables/text_field.dart';
import 'package:aust_pharma1/usuables/user_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String senderID;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

    Message({
        required this.senderID,
        required this.senderEmail,
        required this.receiverId,
        required this.message,
        required this.timestamp,
  });

    //convert to a map
  Map<String,dynamic>toMap(){
    return{
      'senderID': senderID,
      'senderEmail':senderEmail,
      'receiverID':receiverId,
      'message':message,
      'timestamp':timestamp,
    };
  }
}