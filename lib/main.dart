import 'package:doc_doc/core/di/di.dart';
import 'package:doc_doc/feature/presentation/appointment/pages/appointment_screen.dart';
import 'package:doc_doc/feature/presentation/hom/pages/doctor_details.dart';
import 'package:doc_doc/feature/presentation/hom/pages/home_screen.dart';
import 'package:doc_doc/feature/presentation/hom/pages/see_all_screen.dart';
import 'package:doc_doc/feature/presentation/login/pages/login_screen.dart';
import 'package:doc_doc/feature/presentation/onboarding/pages/onboarding_screen.dart';
import 'package:doc_doc/feature/presentation/register/pages/register_screen.dart';
import 'package:doc_doc/feature/presentation/splash/pages/splash.dart';
import 'package:doc_doc/feature/presentation/widgets/build_point.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cache/shared_preference_utils.dart';
import 'core/utils/app_routes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceUtils.init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            initialRoute:AppRoutes.appointmentRoute,
            routes: {
                AppRoutes.splashRoute:(context)=>const SplashScreen(),
                AppRoutes.loginRoute:(context)=>const LoginScreen(),
                AppRoutes.onboardingRoute:(context)=>const OnboardingScreen(),
              AppRoutes.registerRoute:(context)=>RegisterScreen(),
              AppRoutes.homeRoute:(context)=> HomeScreen(),
              AppRoutes.doctorDetailsScreenRoute:(context)=>DoctorDetails(),
              AppRoutes.seeAllDoctors:(context)=>SeeAllScreenDoctors(),
              AppRoutes.appointmentRoute:(context)=>AppointmentScreen(),

            },
          );
        }
    );

  }
}

