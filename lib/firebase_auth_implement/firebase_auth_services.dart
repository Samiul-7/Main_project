



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String id="";

class FirebaseAuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser(){
    return _auth.currentUser;
  }

  Future<User?> signUpWithEmailAndPassword(String email,String pass) async{

    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: pass);

      id=credential.user!.uid;

      return credential.user;
    }catch(e){
      print("Same error occured");
    }
    return null;


  }

  Future<User?> signInWithEmailAndPassword(String email,String pass) async{

    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return credential.user;
    }catch(e){
      print("Same error occured");
    }
    return null;


  }
  String getCurrentUserId() {
    return id;
  }
}