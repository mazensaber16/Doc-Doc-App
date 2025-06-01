import 'package:doc_doc/core/utils/app_styles.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
          backgroundColor: AppColors.transparentColor,
          title: Text(
            'Dr Randy Wigham',
            style: AppStyles.semiBold20Black,
          ),
          centerTitle: true,
          leading: Container(
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppColors.secondGreyColor,
                  width: 1.w,
                )),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.blackColor,
                size: 24.sp,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 42.h),
        child: Align(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 18.w, bottom: 11.5.h),
                child: Row(
                  children: [
                    Container(
                      width: 120.w,
                      height: 110.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage(AssetsManager.doctorAnime),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dr. Randy Wigham",
                              style: AppStyles.bold17Black),
                          SizedBox(height: 4.h),
                          Text("General | RSUD Gatot Subroto ",
                              style: AppStyles.regular16grey),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.amber, size: 16.sp),
                              SizedBox(width: 4.w),
                              Text("4.5", style: AppStyles.regular16grey),
                              SizedBox(width: 8.w),
                              Text("10k+ Reviews",
                                  style: AppStyles.regular14grey),
                            ],
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          //Todo Chat with doctor
                        },
                        child: Image.asset(AssetsManager.chatIcon)),
                    SizedBox(width: 16.w),
                    InkWell(
                        onTap: () {
                          //Todo Voice Call  with doctor
                        },
                        child: Image.asset(AssetsManager.voiceCallIcon))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About me",
                      style: AppStyles.bold17Black,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Dr. Jenny Watson is the top most Immunologists specialist in Christ Hospital at London. She achived several awards for her wonderful contribution in medical field. She is available for private consultation.",
                      style: AppStyles.regular16textGrey,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Working Time",
                      style: AppStyles.bold17Black,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "Monday - Friday, 08.00 AM - 20.00 PM",
                      style: AppStyles.regular16textGrey,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "STR",
                      style: AppStyles.bold17Black,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "4726482464",
                      style: AppStyles.regular16textGrey,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Pengalaman Praktik",
                      style: AppStyles.bold17Black,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "RSPAD Gatot Soebroto",
                      style: AppStyles.semiBold16Black,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "2017 - sekarang",
                      style: AppStyles.regular16textGrey,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomElevatedButton(
                onPressed: () {
                  // Todo Book Appointment
                },
                backgroundColor: AppColors.primaryColor,
                text: "Book Appointment",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
