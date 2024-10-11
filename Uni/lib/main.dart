import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:uni/cubit/uni_cubit.dart';
import 'package:uni/firebase_options.dart';
import 'package:uni/screens/bottom_nav_bar.dart';
import 'package:uni/screens/home/home_main.dart';
import 'package:uni/screens/signPages/auth_screen.dart';
import 'package:uni/screens/signPages/signin.dart';
import 'package:uni/screens/signPages/signup.dart';
import 'package:uni/services/uni_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //UniService().getUni();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //home: AuthScreen(),
      //multi bloc provider
      home: BlocProvider(create: (context) => UniCupit(),
      child: AuthScreen(),),
    );
  }
}