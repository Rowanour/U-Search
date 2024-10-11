import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni/services/auth_service.dart';
import 'package:uni/utils/colors.dart';
import 'package:uni/utils/dimensions.dart';
import 'package:uni/widgets/big_text.dart';
import 'package:uni/widgets/button.dart';
import 'package:uni/widgets/small_text.dart';
import 'package:uni/widgets/text_input.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final _auth = AuthServices();

  void register(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return const Center(
          child: CircularProgressIndicator(color: Colors.teal,));
    });

    if (passController.text == confirmPassController.text) {
      _auth.register(context, emailController.text, passController.text,
          confirmPassController.text);
    }
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
              SizedBox(height: Dimensions.height60), // Space from top
              Center(child: BigText(text: 'Sign Up', size: 30)),
              SizedBox(height: Dimensions.height30),
              SmallText(text: 'Email'),
              SizedBox(height: Dimensions.height10),
              TextInput(hintText: 'Enter your email', obscureText: false, controller: emailController),
              SizedBox(height: Dimensions.height20),
              SmallText(text: 'Password'),
              SizedBox(height: Dimensions.height10),
              TextInput(hintText: 'Enter your password', obscureText: true, controller: passController),
              SizedBox(height: Dimensions.height20),
              SmallText(text: 'Confirm Password'),
              SizedBox(height: Dimensions.height10),
              TextInput(hintText: 'Confirm your password', obscureText: true, controller: confirmPassController),
              SizedBox(height: Dimensions.height40),
              CustomButton(
                text: 'Sign Up',
                onTap: () => register(context),
              ),
              SizedBox(height: Dimensions.height20),
              Center(
                child: SmallText(
                  text: 'Already have an account?',
                  color: AppColors.teal,
                ),
              ),
              SizedBox(height: Dimensions.height10),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SmallText(text: 'Sign In', color: AppColors.teal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
