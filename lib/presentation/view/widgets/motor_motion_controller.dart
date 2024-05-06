import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/enums.dart';
import 'arrow_button.dart';

class MotorMotionController extends StatelessWidget {
  const MotorMotionController({super.key, required this.onMovementChanged, required this.value});
  final ValueChanged onMovementChanged;
  final Movement value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArrowButton(value: value, movement: Movement.forward, onChanged: onMovementChanged),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ArrowButton(value: value, movement: Movement.left, onChanged: onMovementChanged),
            120.horizontalSpace,
            ArrowButton(value: value, movement: Movement.right, onChanged: onMovementChanged),
          ],
        ),
        ArrowButton(value: value, movement: Movement.backward, onChanged: onMovementChanged),
      ],
    );
  }
}
