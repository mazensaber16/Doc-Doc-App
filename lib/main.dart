import 'package:doc_doc/feature/presentation/login/pages/login_screen.dart';
import 'package:doc_doc/feature/presentation/onboarding/pages/onboarding_screen.dart';
import 'package:doc_doc/feature/presentation/register/pages/register_screen.dart';
import 'package:doc_doc/feature/presentation/splash/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/app_routes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,

        builder: (context, child){
          return MaterialApp(
            title: 'Doc Doc',
            theme: ThemeData(),
            debugShowCheckedModeBanner: false,
            initialRoute:AppRoutes.splashRoute,
            routes: {
                AppRoutes.splashRoute:(context)=>SplashScreen(),
                AppRoutes.loginRoute:(context)=>LoginScreen(),
                AppRoutes.onboardingRoute:(context)=>OnboardingScreen(),
              AppRoutes.registerRoute:(context)=>RegisterScreen(),

            },
          );
        }
    );

  }
}

