import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:crops_prediction/extensions/extensions.dart';
import 'package:crops_prediction/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MoistureGauge extends StatelessWidget {
  const MoistureGauge({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      enableLoadingAnimation: true,
      axes: <RadialAxis>[
        RadialAxis(
          annotations: [
            GaugeAnnotation(
              angle: 90,
              positionFactor: 0.4,
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedFlipCounter(
                    duration: const Duration(milliseconds: 1000),
                    value: value,
                    suffix: '%',
                    fractionDigits: 1,
                    textStyle: context.bodyMedium!.s24.setColor(AppColors.textPrimary),
                  ),
                  Text('Soil Moisture', style: context.bodyMedium!.s14.setColor(AppColors.textSecondary)),
                ],
              ),
            ),
          ],
          minimum: 0,
          endAngle: 10,
          maximum: 100,
          startAngle: 170,
          interval: 10,
          minorTicksPerInterval: 4,
          majorTickStyle: const MajorTickStyle(length: 10, thickness: 1),
          ranges: <GaugeRange>[GaugeRange(startValue: 0, endValue: 100, color: AppColors.secondarySwatch)],
          pointers: <GaugePointer>[
            NeedlePointer(
              enableAnimation: true,
              value: value,
              needleEndWidth: 10,
              needleStartWidth: 1,
              enableDragging: true,
              needleColor: AppColors.secondarySwatch,
            ),
          ],
        ),
      ],
    );
  }
}
