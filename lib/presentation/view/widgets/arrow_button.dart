import 'package:crops_prediction/extensions/num_extensions.dart';
import 'package:crops_prediction/extensions/widget_extensions.dart';
import 'package:crops_prediction/presentation/view/screens/motors_screen.dart';
import 'package:crops_prediction/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({super.key, required this.movement, this.value = Movement.stop, required this.onChanged});

  final Movement movement;
  final Movement value;
  final ValueChanged<Movement> onChanged;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32.r,
      backgroundColor: value == movement ? AppColors.white : AppColors.secondary,
      child: Icon(
        Icons.arrow_forward_ios,
        color: value == movement ? AppColors.secondary : AppColors.white,
      ).rotate(movement.angle),
    ).onTap(() {
      if (value == movement) {
        onChanged(Movement.stop);
      } else {
        onChanged(movement);
      }
    }, borderRadius: 100.0.borderRadius).paddingVertical(16);
  }
}
