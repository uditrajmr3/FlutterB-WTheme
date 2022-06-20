import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

Future<void> userSetup(String username, email, password) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = "";
  uid = auth.currentUser!.email.toString();
  users.doc(uid).set({
    'username': username,
    'email': email,
    'password': password,
    'uid': uid,
  });
  return;
}
