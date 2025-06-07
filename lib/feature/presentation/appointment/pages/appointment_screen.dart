import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doc_doc/feature/presentation/widgets/build_point.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_elevated_button.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class AppointmentScreen extends StatefulWidget {
  AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int activeStep = 0;
  DateTime selectedDate = DateTime.now();
  List<String> availableTimes = [
    '09:00 AM', '10:00 AM', '11:00 AM',
    '12:00 PM', '01:00 PM', '02:00 PM',
    '03:00 PM', '04:00 PM', '05:00 PM',
  ];

  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildEasyStepper(),
                SizedBox(height: 41.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Select Date", style: AppStyles.bold20Black),
                    TextButton(
                      onPressed: () async {
                        // TODO: Custom Date Picker

                        DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                        );

                        if (pickedDate != null) {
                        setState(() {
                        selectedDate = pickedDate;
                        });
                        }
                      },
                      child: Text(" Set Manual ",
                          style: AppStyles.semiBold16Primary),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  height: 90.h,
                  child: DatePicker(
                    DateTime.now(),

                    selectionColor: AppColors.primaryColor,
                    selectedTextColor: AppColors.whiteColor,
                    daysCount: 30,
                    locale: 'en_US',
                    onDateChange: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                    initialSelectedDate: selectedDate,
                  ),
                ),
                SizedBox(height: 20.h),
                Text("Available Time", style: AppStyles.bold20Black),
                SizedBox(height: 16.h),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 7.h,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: 3.5, // لتناسب العرض والطول
                  children: availableTimes.map((time) {
                    final isSelected = selectedTime == time;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTime = time;
                        });
                      },
                      child: Container(
                        width: 60.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: isSelected ? AppColors.primaryColor : AppColors.transparentColor,
                          ),
                        ),
                        child: Text(
                          time,
                          style: TextStyle(
                            color: isSelected ? Colors.white : AppColors.blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 24.h),
              Text("Appointment Type", style: AppStyles.bold20Black),
                SizedBox(height: 16.h),
              SessionTypeSelector(),
                SizedBox(height: 10.h),
                CustomElevatedButton(onPressed: (){
                  //Todo Appointment Booking Logic
                }, backgroundColor: AppColors.primaryColor,
                text: "Continue",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  EasyStepper buildEasyStepper() {
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
