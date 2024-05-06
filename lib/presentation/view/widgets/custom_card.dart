import 'dart:ui';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:crops_prediction/extensions/num_extensions.dart';
import 'package:crops_prediction/extensions/widget_extensions.dart';
import 'package:crops_prediction/presentation/view/widgets/element_widget.dart';
import 'package:crops_prediction/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.value,
    required this.symbol,
    required this.number,
    required this.color,
    required this.icon,
  });

  final String title;
  final String value;
  final String symbol;
  final String number;
  final Color color;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              alignment: Alignment.topLeft,
              padding: 8.edgeInsetsAll,
              decoration: const BoxDecoration(color: AppColors.secondary),
              child: SvgPicture.asset(icon, height: 40, width: 40),
            ),
          ),
        ),
        Positioned(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElementWidget(character: symbol, number: number, color: color),
              10.verticalSpace,
              Text(title, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              AnimatedFlipCounter(suffix: '%', duration: const Duration(milliseconds: 500), value: double.parse(value))
            ],
          ).paddingSymmetric(10.r, 14.r).withGlassEffect(radius: 12.r),
        ),
      ],
    );
  }
}
