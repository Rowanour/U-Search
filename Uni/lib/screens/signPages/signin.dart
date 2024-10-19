import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:uni/screens/signPages/signup.dart';
import 'package:uni/services/auth_service.dart';
import 'package:uni/utils/colors.dart';
import 'package:uni/utils/dimensions.dart';
import 'package:uni/widgets/big_text.dart';
import 'package:uni/widgets/button.dart';
import 'package:uni/widgets/small_text.dart';
import 'package:uni/widgets/text_input.dart';

import '../home/slide.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();
  
  final _auth = AuthServices();
  void login(BuildContext context){
    showDialog(context: context, builder: (context) {
      return const Center(child: CircularProgressIndicator(color: Colors.teal,));
    });

    _auth.login(context, emailController.text, passController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sky,
      body: Padding(
        padding: EdgeInsets.all(Dimensions.width20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Dimensions.height60),
              Center(child: BigText(text: 'Sign In', size: 30)),
              SizedBox(height: Dimensions.height30),
              SmallText(text: 'Email'),
              SizedBox(height: Dimensions.height10),
              TextInput(hintText: 'Enter your email', obscureText: false,controller: emailController),
              SizedBox(height: Dimensions.height20),
              SmallText(text: 'Password'),
              SizedBox(height: Dimensions.height10),
              TextInput(hintText: 'Enter your password', obscureText: true, controller: passController),
              SizedBox(height: Dimensions.height40),
              CustomButton(text: 'Sign in', onTap: () => login(context)
              ),
              SizedBox(height: Dimensions.height40),
          
              SizedBox(height: Dimensions.height20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallText(text: 'Don\'t have an account?'),
              SizedBox(width: Dimensions.width10),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => SignUpPage()),
                  );
                },
                child: SmallText(text: 'Sign Up', color: AppColors.teal),
              ),
            ],
          ),
            ],
          ),
        ),
      ),
    );
  }
}
