import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uni/utils/colors.dart';
import 'package:uni/utils/dimensions.dart';
import 'package:uni/widgets/big_text.dart';
import 'package:uni/services/auth_service.dart';
import '../widgets/button.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth = AuthServices();
  void logout(BuildContext context) {
    _auth.logout(context);
  }

  bool isEditing = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    nameController.text = user?.displayName ?? "User Name";
    emailController.text = user?.email ?? "example@mail.com";
    phoneController.text = "123-456-7890";
    addressController.text = "123 Main St, City, Country";
    bioController.text = "This is your bio";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.sky,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: BigText(
                  text: "Profile",
                  size: 30,
                  color: AppColors.navy,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    enabled: isEditing,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: AppColors.teal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    enabled: isEditing,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: AppColors.teal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: phoneController,
                    enabled: isEditing,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: AppColors.teal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: addressController,
                    enabled: isEditing,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      labelStyle: TextStyle(color: AppColors.teal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: bioController,
                    enabled: isEditing,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Bio',
                      labelStyle: TextStyle(color: AppColors.teal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    text: isEditing ? 'Save Profile' : 'Edit Profile',
                    onTap: () {
                      setState(() {
                        if (isEditing) {}
                        isEditing = !isEditing;
                      });
                    },
                    color: AppColors.teal,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'Log Out',
                    onTap: () {
                      logout(context);
                    },
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
