import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  TextOverflow overflow;
  double height;

  SmallText(
      {super.key,
        this.color = const Color(0xFF2C2C31),
        required this.text,
        this.overflow = TextOverflow.ellipsis,
        this.size = 0,
      this.height = 0});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 2,
      text,
      overflow: overflow,
      style: GoogleFonts.signika(
        textStyle: TextStyle(
            color: color, fontSize: size==0? Dimensions.font12: size, height: Dimensions.height1),
      ),
    );
  }
}
