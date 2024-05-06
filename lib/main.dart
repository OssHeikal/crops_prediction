import 'package:crops_prediction/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presentation/view/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    ScreenUtil.ensureScreenSize(),
  ]).then((value) => runApp(const MyApp()));
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
            home: const HomeScreen(),
          );
        });
  }
}
