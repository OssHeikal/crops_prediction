import 'package:crops_prediction/extensions/context_extension.dart';
import 'package:crops_prediction/extensions/string_extension.dart';
import 'package:crops_prediction/extensions/text_style_extensions.dart';
import 'package:crops_prediction/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/enums.dart';
import '../widgets/motor_motion_controller.dart';

class MotorsScreens extends StatefulWidget {
  const MotorsScreens({super.key});

  @override
  State<MotorsScreens> createState() => _MotorsScreensState();
}

class _MotorsScreensState extends State<MotorsScreens> {
  final _movement = ValueNotifier(Movement.stop);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        backgroundColor: AppColors.primary,
        title: const Text('Motors', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
      body: ValueListenableBuilder(
        valueListenable: _movement,
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MotorMotionController(
                value: _movement.value,
                onMovementChanged: (movement) => _movement.value = movement,
              ).paddingHorizontal(20).withGlassEffect(),
              52.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Current Movement: ',
                    style: context.bodySmall!.s16.setColor(AppColors.textSecondary),
                  ),
                  Text(value.name.capitalize(), style: context.bodySmall!.bold.s16.setColor(AppColors.white)),
                ],
              ),
            ],
          ).paddingHorizontal(20).center();
        },
      ),
    );
  }
}
