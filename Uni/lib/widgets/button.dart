import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color color;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Dimensions.height12),
        decoration: BoxDecoration(
          color: AppColors.navy,
          borderRadius: BorderRadius.circular(Dimensions.radius30),
        ),
        child: Center(
          child: BigText(
            text: text,
            size: 18,
            color: AppColors.sky,
          ),
        ),
      ),
    );
  }
}
