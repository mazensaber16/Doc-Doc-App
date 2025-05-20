
import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
@override
  void initState() {
    super.initState();
    redirect();
  }
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(

        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AssetsManager.backgroundImage),
              Image.asset(AssetsManager.logoApp),
            ],
          ),
        ),
      ),
    );
  }
  Future<void>redirect()async{
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacementNamed(context, AppRoutes.onboardingRoute);
  }
}
