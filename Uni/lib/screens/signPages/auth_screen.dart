import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni/screens/bottom_nav_bar.dart';
import 'package:uni/screens/home/home_main.dart';
import 'package:uni/screens/signPages/signin.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){
        if(snapshot.hasData){
          return BottomNavBar();
        }else{
          return SignInPage();
        }
      }),
    );
  }
}