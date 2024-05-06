import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:crops_prediction/extensions/extensions.dart';
import 'package:crops_prediction/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalDataRow extends StatelessWidget {
  const HorizontalDataRow({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        if (double.tryParse(value) != null)
          AnimatedFlipCounter(suffix: 'mm', value: double.parse(value), fractionDigits: 1)
        else
          Text(value, style: const TextStyle(fontSize: 14)),
      ],
    ).setContainerToView(
      padding: 16.r,
      radius: 12.r,
      color: AppColors.secondary,
      borderColor: AppColors.divider.withOpacity(0.1),
    );
  }
}
