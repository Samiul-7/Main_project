import 'package:aust_pharma1/usuables/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? currentUser = FirebaseAuth.instance.currentUser;

  /////////////////////////////////////////////////////////////
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _AddressController=TextEditingController();

  final userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> editField(String field) async {
    late String fieldName;
    late TextEditingController controller;

    if (field == 'Name') {
      fieldName = 'Name';
      controller = _nameController;
    } else if (field == 'Address') {
      fieldName = 'Address';
      controller = _AddressController;
    } else {
      return;
    }
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          'Edit $fieldName',
          style: TextStyle(color: Colors.black),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Enter new $fieldName',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () async {
              if (controller.text.isNotEmpty) {
                try {
                  await userCollection
                      .doc(currentUser?.uid)
                      .update({field: controller.text});
                  setState(() {
                    if (field == 'Name') {
                      _nameController.text = controller.text;
                    } else if (field == 'Address') {
                      _AddressController.text = controller.text;
                    }
                  });
                  print('Updated $field to: ${controller.text}');
                  Navigator.of(context).pop();
                } catch (e) {
                  print("Error updating $field: $e");
                }
              } else {
                print('Value cannot be empty');
              }
            },
          ),
        ],
      ),
    );
  }
  ////////////////////////////////////////////////////////////

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
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
      backgroundColor: Colors.white,
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
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 43,
                      child: CircleAvatar(
                        child:Container(
                          height: 60,
                          width: 60,
                          child: Image.asset("assets/abstract.png"),
                        ),
                        backgroundColor: Colors.orangeAccent,
                        radius: 40,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: Text("User Informations",style: TextStyle(
                        fontSize: 20,color: Colors.orange,
                      ),),
                    ),
                    Divider(
                      thickness: 2.5,
                      color: Colors.grey[900],
                    ),
                    Row(children: [
                      Text("Name :             ${data['Name']}",style: const TextStyle(fontSize: 21,fontWeight:FontWeight.bold,color: Colors.black),),
                      const SizedBox(width: 80,),
                      IconButton(
                          color: Colors.black,
                          onPressed:() => editField('Name'),
                          icon: const Icon(Icons.edit)),
                    ],),
                    Row(children: [
                      Text('Address :         ${data['Address']}',style: const TextStyle(fontSize: 21,fontWeight:FontWeight.bold,color: Colors.black),),
                      const SizedBox(width: 80,),
                      IconButton(
                          color: Colors.black,
                          onPressed:() => editField('Address'),
                          icon: const Icon(Icons.edit)),
                    ],),
                    const SizedBox(height: 20,),
                    Row(children: [
                      Text('Email:            ${data['E-mail']}',style: const TextStyle(fontSize: 21,fontWeight:FontWeight.bold,color: Colors.black),),
                      const SizedBox(width: 50,),
                    ],),

                    const SizedBox(height: 180,),

                    ElevatedButton(onPressed:logout,
                      // child: Text('Back',style: TextStyle(fontSize: 15),)
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey[900]), // Change button color
                        minimumSize: MaterialStateProperty.all(Size(150, 40)), // Change button size
                        padding: MaterialStateProperty.all(EdgeInsets.all(15)), // Adjust internal padding
                        textStyle: MaterialStateProperty.all(
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Adjust text style
                        ),
                      ),
                      child: const Text('Logout',
                        style: TextStyle(color: Colors.white,fontStyle:FontStyle.italic),
                      ),
                    ),

                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed:
                        () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_)=>home_page()));
                    },
                        // child: Text('Back',style: TextStyle(fontSize: 15),)
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey[900]), // Change button color
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
                );
              }
              return const Text("loading");
            },
          )
      ),
    );

  }
  logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_)=>login_page()));
    } catch (e) {
      print(e);
    }
  }

}
