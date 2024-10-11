import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni/screens/home/slide.dart';
import 'package:uni/utils/colors.dart';
import 'package:uni/utils/dimensions.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        top: Dimensions.height10,
                        bottom: Dimensions.height10),
                    child: Text(
                      'U Search',
                      style: GoogleFonts.lobster(
                        textStyle: TextStyle(
                          color: AppColors.navy,
                          fontWeight: FontWeight.w700,
                          fontSize: Dimensions.font25,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                         EdgeInsets.only(right: Dimensions.width20, bottom: Dimensions.height10, top: Dimensions.height10),
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    child: const Icon(Icons.search, color: Colors.white),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.navy,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SingleChildScrollView(
              child: Slide(),
            ))

          ],
        ),
      ),
    );
  }
}
