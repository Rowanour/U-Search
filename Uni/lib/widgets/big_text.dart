import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uni/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText(
      {super.key,
       this.color = const Color(0xFF2F4156),
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 0});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 1,
      text,
      overflow: overflow,
      style: GoogleFonts.oleoScript(
        textStyle: TextStyle(
            color: color, fontWeight: FontWeight.w400,
            fontSize: size==0? Dimensions.font20:size),
      ),
    );
  }
}
