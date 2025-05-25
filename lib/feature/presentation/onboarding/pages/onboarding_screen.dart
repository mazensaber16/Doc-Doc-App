import 'package:doc_doc/core/utils/app_assets.dart';
import 'package:doc_doc/core/utils/app_colors.dart';
import 'package:doc_doc/core/utils/app_routes.dart';
import 'package:doc_doc/core/utils/app_styles.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Column(children: [
              Container(
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.14, 0.4],
                    colors: [
                      AppColors.whiteColor,
                      AppColors.whiteColor.withOpacity(0.0),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      AssetsManager.logoApp,
                      scale: 1.24.sp,
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AssetsManager.backgroundImage,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        // صورة الدكتور
                        Image.asset(
                          AssetsManager.doctorImage,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                "Best Doctor\n Appointment App",
                style: AppStyles.bold32primary,
                textAlign: TextAlign.center,
              ),
              Text(
                "Manage and schedule all of your medical appointments easily\n "
                "with Docdoc to get a new experience.",
                style: AppStyles.regular16grey,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child: CustomElevatedButton(
                  onPressed: () {
                    //Todo: Navigate To Login Screen
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.loginRoute);
                  },
                  backgroundColor: AppColors.primaryColor,
                  text: "Get Started ",
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
