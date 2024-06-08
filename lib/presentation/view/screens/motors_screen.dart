import 'package:crops_prediction/data/datasource/realtime_data_source.dart';
import 'package:crops_prediction/extensions/extensions.dart';
import 'package:crops_prediction/extensions/string_extension.dart';
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
  late final RealtimeDataBase _realtimeDataBase;

  final _movement = ValueNotifier(Movement.stop);
  final _waterPump = ValueNotifier(false);

  @override
  void initState() {
    _realtimeDataBase = RealtimeDataBase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _waterPump,
        builder: (context, waterPump, child) {
          return Scaffold(
            backgroundColor: AppColors.primary,
            appBar: AppBar(
              centerTitle: true,
              forceMaterialTransparency: true,
              backgroundColor: AppColors.primary,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () async {
                  Navigator.pop(context);
                  await _realtimeDataBase.move(Movement.stop.motorModel.copyWith(waterPump: false));
                },
              ),
              title: Text('Motors', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
            ),
            floatingActionButton: CircleAvatar(
              radius: 32.r,
              backgroundColor: waterPump ? AppColors.accent : AppColors.secondary,
              child: const Icon(Icons.water_drop, color: AppColors.white),
            ).onTap(() async {
              if (waterPump) {
                _waterPump.value = false;
                await _realtimeDataBase.move(_movement.value.motorModel.copyWith(waterPump: false));
              } else {
                _waterPump.value = true;
                await _realtimeDataBase.move(_movement.value.motorModel.copyWith(waterPump: true));
              }
            }, borderRadius: 100.0.borderRadius).paddingVertical(16),
            body: ValueListenableBuilder(
              valueListenable: _movement,
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MotorMotionController(
                      waterPump: _waterPump.value,
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
                    8.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Water Pump: ',
                          style: context.bodySmall!.s16.setColor(AppColors.textSecondary),
                        ),
                        Text(waterPump ? 'on' : 'off', style: context.bodySmall!.bold.s16.setColor(AppColors.white)),
                      ],
                    ),
                  ],
                ).paddingHorizontal(20).center();
              },
            ),
          );
        });
  }
}
