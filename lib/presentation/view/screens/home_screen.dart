import 'package:crops_prediction/data/datasource/realtime_data_source.dart';
import 'package:crops_prediction/data/models/prediction_model.dart';
import 'package:crops_prediction/extensions/extensions.dart';
import 'package:crops_prediction/extensions/string_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../resources/app_colors.dart';
import '../widgets/custom_card.dart';
import '../widgets/horizontal_data_row.dart';
import '../widgets/moisture_gauge.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final RealtimeDataBase _realtimeDataBase;

  @override
  void initState() {
    _realtimeDataBase = RealtimeDataBase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        backgroundColor: AppColors.primary,
        title: const Text('Crops Prediction', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
      body: StreamBuilder<PredictionModel>(
          stream: _realtimeDataBase.read('predictions'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('An error occurred'));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CupertinoActivityIndicator());
            }
            final data = snapshot.data!;
            return Stack(
              children: [
                Column(children: [MoistureGauge(value: data.moisture.toDouble())]),
                Positioned(
                  top: 0.42.sh,
                  left: 0,
                  right: 0,
                  child: AnimationLimiter(
                    child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 100.0,
                          child: FadeInAnimation(child: widget),
                        ),
                        children: [
                          20.verticalSpace,
                          Row(
                            children: [
                              CustomCard(element: data.nitrogen, color: const Color(0xFFacd5ff)).expand(),
                              8.horizontalSpace,
                              CustomCard(element: data.phosphorus, color: const Color(0xFFffe473)).expand(),
                              8.horizontalSpace,
                              CustomCard(element: data.potassium, color: const Color(0xFF99f5dc)).expand(),
                            ],
                          ),
                          20.verticalSpace,
                          HorizontalDataRow(title: 'Rainfall', value: data.rainfall.toString()),
                          20.verticalSpace,
                          HorizontalDataRow(title: 'Predicted', value: data.prediction.capitalize()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ).paddingHorizontal(20.w);
          }),
    );
  }
}