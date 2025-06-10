import 'package:doc_doc/core/utils/app_routes.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_elevated_button.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class PaymentScreen extends StatefulWidget {
   PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}
List<Map<String, String>> creditCards = [
  {'name': 'Master Card', 'asset': AssetsManager.masterCard},
  {'name': 'American Express', 'asset': AssetsManager.americanExpress},
  {'name': 'Capital One', 'asset': AssetsManager.capital},
  {'name': 'Barclays', 'asset': AssetsManager.barclay},
];
String selectedMethod = 'Credit Card';
class _PaymentScreenState extends State<PaymentScreen> {
  int activeStep = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
      backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.transparentColor,
          title: Text(
            "Book Appointment",
            style: AppStyles.semiBold20Black,
          ),
          centerTitle: true,
          leading: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 5.h,
              vertical: 5.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: AppColors.secondGreyColor,
                width: 1.w,
              ),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.blackColor,
                size: 18.sp,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 14.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              buildStepper(),
              SizedBox(height: 30.h,),
              Text(" Payment Option",style: AppStyles.bold20Black,),
              SizedBox(height: 24.h,),
              RadioListTile(
                value: 'Credit Card',
                activeColor: AppColors.primaryColor,
                groupValue: selectedMethod,
                onChanged: (value) => setState(() => selectedMethod = value!),
                title: Text('Credit Card'),
              ),
              if (selectedMethod == 'Credit Card')
                Column(
                  children: creditCards.map((card) {
                    return ListTile(
                      leading: Image.asset(card['asset']!, width: 32),
                      title: Text(card['name']!),
                    );
                  }).toList(),
                ),
              RadioListTile(
                activeColor: AppColors.primaryColor,

                value: 'Bank Transfer',
                groupValue: selectedMethod,
                onChanged: (value) => setState(() => selectedMethod = value!),
                title: Text('Bank Transfer'),
              ),
              RadioListTile(
                activeColor: AppColors.primaryColor,
                selectedTileColor: AppColors.greenColor,
                value: 'Paypal',
                groupValue: selectedMethod,
                onChanged: (value) => setState(() => selectedMethod = value!),
                title: Text('Paypal'),
              ),
              Spacer(),
              CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.summaryRoute);
                  },
                  backgroundColor: AppColors.primaryColor,
                text: "Continue",
              )
            ],
          ),
        ),
      ),
    );
  }

  EasyStepper buildStepper() {

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
              child: Text("1", style: AppStyles.semiBold18White),
            ),
          ),
          customTitle: Text(
            'Date & Time',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: activeStep > 0
                  ? AppColors.greenColor
                  : AppColors.blackColor,
            ),
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 1 ? 1 : 0.3,
              child: Text('2', style: AppStyles.semiBold18White),
            ),
          ),
          customTitle: Text(
            'Payment',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: activeStep > 1
                  ? AppColors.greenColor
                  : AppColors.blackColor,
            ),
          ),
        ),
        EasyStep(
          customStep: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Opacity(
              opacity: activeStep >= 2 ? 1 : 0.3,
              child: Text('3', style: AppStyles.semiBold18White),
            ),
          ),
          customTitle: Text(
            'Summary',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: activeStep > 2
                  ? AppColors.greenColor
                  : AppColors.blackColor,
            ),
          ),
        ),
      ],
      onStepReached: (index) => setState(() => activeStep = index),
    );
  }
}
