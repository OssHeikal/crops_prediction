import 'package:crops_prediction/extensions/num_extensions.dart';
import 'package:crops_prediction/extensions/widget_extensions.dart';
import 'package:crops_prediction/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElementWidget extends StatelessWidget {
  const ElementWidget({
    super.key,
    required this.character,
    required this.number,
    required this.color,
    this.size = 35,
  });

  final String character;
  final String number;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.sp,
      width: size.sp,
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(color: color, borderRadius: 1.0.borderRadius),
      child: Row(
        children: [
          Text(number, style: TextStyle(fontSize: 8.sp, color: AppColors.primary)).paddingBottom(16),
          Text(
            character,
            style: TextStyle(fontSize: 24.sp, height: 1, color: AppColors.primary, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
