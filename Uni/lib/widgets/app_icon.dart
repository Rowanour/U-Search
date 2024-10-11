import 'package:flutter/cupertino.dart';
import 'package:uni/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final double size;
  const AppIcon(
      {super.key,
      required this.icon,
      this.bgColor = const Color(0xFFC8D9E6),
      this.iconColor = const Color(0xFF2F4156),
      this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: bgColor
      ),
      child: Icon(icon, color: iconColor, size: Dimensions.height16,),
    );
  }
}
