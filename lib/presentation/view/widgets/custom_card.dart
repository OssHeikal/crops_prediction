import 'dart:ui';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:crops_prediction/data/models/element_model.dart';
import 'package:crops_prediction/extensions/num_extensions.dart';
import 'package:crops_prediction/extensions/string_extension.dart';
import 'package:crops_prediction/extensions/widget_extensions.dart';
import 'package:crops_prediction/presentation/view/widgets/element_widget.dart';
import 'package:crops_prediction/resources/app_colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.element, required this.color});

  final ElementModel element;
  final Color color;

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
              child: SvgPicture.asset(element.name.svg, height: 40, width: 40),
            ),
          ),
        ),
        Positioned(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElementWidget(character: element.symbol, number: element.atomicNumber.toString(), color: color),
              10.verticalSpace,
              Text(element.name, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              AnimatedFlipCounter(
                suffix: '%',
                duration: const Duration(milliseconds: 500),
                value: element.value.toDouble(),
              )
            ],
          ).paddingSymmetric(10.r, 14.r).withGlassEffect(radius: 12.r),
        ),
      ],
    );
  }
}
