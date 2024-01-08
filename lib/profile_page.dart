import 'package:aust_pharma1/usuables/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid) // Assuming your document ID is the user's UID
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Colors.green,
        title: Row(
          children: [
            SizedBox(width: 10),
            Text('Profile Page',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                )
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey,
      body: Container(
          child: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get(),
        builder:
            (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting){
            return const LinearProgressIndicator();
          }

          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if(snapshot.data == null){
            return const Text("No data");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                const Icon(
                  Icons.person,
                  size: 72,
                ),
                const SizedBox(height: 10),
                Text("User Informations",style: TextStyle(
                  fontSize: 20,color: Colors.orange,
                ),),
                Text("Name : ${data['Name']}",style: const TextStyle(fontSize: 18,color: Colors.black),),
                const SizedBox(height: 10,),
                Text('Address : ${data['Address']}',style: const TextStyle(fontSize: 18,color: Colors.black),),
                const SizedBox(height: 5,),
                Text('Email Account : ${data['E-mail']}',style: const TextStyle(fontSize: 18,color: Colors.black),),
                const SizedBox(height: 30,),
                ElevatedButton(onPressed:
                        () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_)=>home_page()));
                    },
                    child: Text('Back',style: TextStyle(fontSize: 15),)
                ),
              ],
            );
          }
          return const Text("loading");
        },
      )
      ),
    );
  }
}
