// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/auth/login.dart';
import 'package:untitled/auth/Signup.dart';
import 'package:untitled/curd/addnotes.dart';
import 'package:untitled/curd/editnotes.dart';
import 'package:untitled/home/Homepage.dart';
import 'package:firebase_core/firebase_core.dart';

bool? islogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var sl = FirebaseAuth.instance.currentUser;
  if (sl == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp(Runapp());
}

class Runapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData().copyWith(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Color.fromARGB(255, 0, 67, 122)),
        ),
        debugShowCheckedModeBanner: false,
        home: islogin == false ? Login() : Homepage(),
        routes: {
          "login": (context) => Login(),
          "signup": (context) => Signup(),
          "homepage": (context) => Homepage(),
          "addnotes": (context) => Addnotes(),
          "editnotes": (context) => Editnotes()
        });
  }
}
