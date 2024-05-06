import 'dart:ui';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:crops_prediction/extensions/context_extension.dart';
import 'package:crops_prediction/extensions/num_extensions.dart';
import 'package:crops_prediction/extensions/text_style_extensions.dart';
import 'package:crops_prediction/extensions/widget_extensions.dart';
import 'package:crops_prediction/firebase_options.dart';
import 'package:crops_prediction/resources/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    ScreenUtil.ensureScreenSize(),
    // configureInjection(),
  ]).then(
    (value) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.dark,
            theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
            home: const MyHomePage(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        // forceMaterialTransparency: true,
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: const Text('Crops Prediction', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SfRadialGauge(
                enableLoadingAnimation: true,
                // title: const GaugeTitle(text: 'Soil Moisture'),
                axes: <RadialAxis>[
                  RadialAxis(
                    annotations: [
                      GaugeAnnotation(
                        angle: 90,
                        positionFactor: 0.4,
                        widget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const AnimatedFlipCounter(
                              duration: Duration(milliseconds: 500),
                              value: 70,
                              suffix: '%',
                              textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
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
                    pointers: const <GaugePointer>[
                      NeedlePointer(
                        value: 70,
                        needleEndWidth: 10,
                        needleStartWidth: 1,
                        enableDragging: true,
                        needleColor: AppColors.secondarySwatch,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0.42.sh,
            left: 0,
            right: 0,
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  delay: const Duration(milliseconds: 100),
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(child: widget),
                  ),
                  children: [
                    20.verticalSpace,
                    Row(
                      children: [
                        const CustomCard(
                          title: 'Nitrogen',
                          value: '20',
                          symbol: 'N',
                          number: '7',
                          color: Color(0xFFacd5ff),
                          icon: 'assets/icons/nitrogen.svg',
                        ).expand(),
                        8.horizontalSpace,
                        const CustomCard(
                          title: 'Phosphorus',
                          value: '50',
                          symbol: 'P',
                          number: '15',
                          color: Color(0xFFffe473),
                          icon: 'assets/icons/phosphorus.svg',
                        ).expand(),
                        8.horizontalSpace,
                        const CustomCard(
                          title: 'Potassium',
                          value: '20',
                          symbol: 'K',
                          number: '19',
                          color: Color(0xFF99f5dc),
                          icon: 'assets/icons/potassium.svg',
                        ).expand(),
                      ],
                    ),
                    20.verticalSpace,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rainfall", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        AnimatedFlipCounter(
                          suffix: 'mm',
                          value: 50,
                        ),
                      ],
                    ).setContainerToView(
                      padding: 16.r,
                      radius: 16.r,
                      color: AppColors.secondary,
                      borderColor: AppColors.divider.withOpacity(0.1),
                    ),
                    20.verticalSpace,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Prediction", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        Text("Rice", style: TextStyle(fontSize: 14)),
                      ],
                    ).setContainerToView(
                      padding: 16.r,
                      radius: 16.r,
                      color: AppColors.secondary,
                      borderColor: AppColors.divider.withOpacity(0.1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ).paddingHorizontal(20.w),
    );
  }
}

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
          borderRadius: BorderRadius.circular(16.r),
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
              // Text(value, style: const TextStyle(fontSize: 14)),
            ],
          ).paddingSymmetric(8.r, 16.r).withGlassEffect(),
        ),
      ],
    );
  }
}

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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 6,
          top: -6,
          child: Container(
            height: size,
            width: size,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(color: color),
            child: Text(
              number,
              style: const TextStyle(fontSize: 8, height: 1, color: AppColors.primary),
            ).paddingBottom(10),
          ),
        ),
        Container(
          height: size,
          width: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(color: AppColors.primary, width: 1.25)),
          child: Text(
            character,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1, color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
