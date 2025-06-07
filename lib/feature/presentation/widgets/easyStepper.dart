
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class EasyStepper extends StatefulWidget {
  const EasyStepper({super.key, required activeStepBackgroundColor, required unreachedStepBackgroundColor, required StepShape stepShape, required Color finishedStepBackgroundColor, required stepRadius, required bool showLoadingAnimation, required LineStyle lineStyle, required double internalPadding, required List<EasyStep> steps, required int activeStep, required Function(dynamic index) onStepReached});

  @override
  State<EasyStepper> createState() => _EasyStepperState();
}

class _EasyStepperState extends State<EasyStepper> {
int activeStep = 0;

  @override
  Widget build(BuildContext context) {
      return EasyStepper(

      activeStepBackgroundColor: AppColors.primaryColor,
      activeStep: activeStep,
      unreachedStepBackgroundColor: AppColors.searchColor,
      stepShape: StepShape.circle,

      finishedStepBackgroundColor: AppColors.greenColor,
      stepRadius: 22.r,

      showLoadingAnimation: false,
      lineStyle: LineStyle(

        lineType: LineType.normal,
        defaultLineColor: AppColors.greyColor,
        finishedLineColor: AppColors.greenColor,
      ),
      internalPadding: 50.w,
      steps: [
        EasyStep(

          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 0 ? 1 : 0.3,
              child: Text("1",style: AppStyles.semiBold18White,),
            ),
          ),
          customTitle: Text(
            'Date & Time',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: activeStep > 0 ? AppColors.greenColor : (activeStep == 0 ? AppColors.blackColor : AppColors.blackColor),
            ),              ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 1 ? 1 : 0.3,
              child: Text('2',style: AppStyles.semiBold18White),
            ),
          ),
          customTitle:  Text(

            'Payment',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: activeStep > 1 ? AppColors.greenColor : (activeStep == 0 ? AppColors.blackColor : AppColors.blackColor),
            ),
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 2 ? 1 : 0.3,
              child: Text(3.toString(), style: AppStyles.semiBold18White,),
            ),
          ),
          customTitle:  Text(
            style: TextStyle(
              color: activeStep > 2 ? AppColors.greenColor : (activeStep == 0 ? AppColors.blackColor : AppColors.blackColor),
            ),
            "Summary",
            textAlign: TextAlign.center,
          ),
        ),

      ],
      onStepReached: (index) => setState(() => activeStep = index),
    );
  }
}

