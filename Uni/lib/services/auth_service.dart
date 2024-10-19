import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AuthServices {
  void register(BuildContext context, String email, String password,
      String confirmPassword) async {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return Center(
    //           child: CircularProgressIndicator(
    //             color: AppColors.navy,
    //           ));
    //     });

    try {
      password == confirmPassword;
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
    }
  }

  void login(BuildContext context, String email, String password) async {
    // showDialog(context: context, builder: (context) {
    //   return Center(child: CircularProgressIndicator(color: AppColors.navy,));
    // });


    try {
      {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, password: password);
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
    }
  }



  void logout(BuildContext context)async {
    await FirebaseAuth.instance.signOut();
  }
}