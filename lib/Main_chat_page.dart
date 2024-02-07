//import 'dart:js';

import 'package:aust_pharma1/chat_bubble.dart';
import 'package:aust_pharma1/chat_service.dart';
import 'package:aust_pharma1/firebase_auth_implement/firebase_auth_services.dart';
import 'package:aust_pharma1/homepage.dart';
import 'package:aust_pharma1/signup_page.dart';
import 'package:aust_pharma1/usuables/text_field.dart';
import 'package:aust_pharma1/usuables/user_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Main_chat_page extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;

    Main_chat_page({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

  @override
  State<Main_chat_page> createState() => _Main_chat_pageState();
}

class _Main_chat_pageState extends State<Main_chat_page> {
  final ChatService _chatService= ChatService();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _messageController= TextEditingController();

  FocusNode myFocusNode=FocusNode();

  @override
  void initState() {
    super.initState();

    myFocusNode.addListener(() {
      if(myFocusNode.hasFocus){
        // cause a delay 
        Future.delayed(
          const Duration(milliseconds: 500),
            ()=> scrollDown(),
        );
      }
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();

  }

  final ScrollController _scrollController=ScrollController();
  void scrollDown(){
    _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
    );
  }

  //send msg
  void sendMessage() async{
    if(_messageController.text.isNotEmpty)
      await _chatService.sendMsg(widget.receiverID,_messageController.text);

    _messageController.clear();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.receiverEmail,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: _buildMessageList()
          ),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList(){
    String senderID = _auth.getCurrentUser()!.uid;

    return StreamBuilder(
        stream: _chatService.getMessage(widget.receiverID,senderID),

        builder: (context,snapshot){
          // print(snapshot.data);
          // print("!!!!!!!!!!!!!!!");
          //error
          if(snapshot.hasError)
            return const Text('Error');

          //loading
          if(snapshot.connectionState==ConnectionState.waiting)
            return const Text('Loading......');
          //return list view
          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
          );
        }
    );
  }

  //build msg item
  Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String,dynamic> data=doc.data() as Map<String,dynamic>;
      bool isCurrentUser= data?['senderID']==_auth.getCurrentUser()!.uid;
      var alignment=isCurrentUser? Alignment.centerRight:Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment:
          isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          //Text(data["message"]),
          ChatBubble(message: data["message"],
              isCurrentUser: isCurrentUser,
          )
        ],
      ),
    );
  }

  // Widget _buildMessageItem(DocumentSnapshot doc) {
  Widget _buildUserInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Row(
        children: [
          Expanded(
              child: my_text_field(
                controller: _messageController,
                hintText:'Type a message',
                obscureText: false,
                focusNode: myFocusNode,
              )
          ),

          //send button
          Container(
            decoration: const BoxDecoration(
                color: Colors.green,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(right: 25),
            child: IconButton(onPressed: sendMessage, icon: const Icon(Icons.arrow_upward,color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}

