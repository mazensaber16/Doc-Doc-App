import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class BookingBanner extends StatelessWidget {
  const BookingBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 165.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.primaryColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 28.w, top: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Book and \nschedule with \nnearest doctor", style: AppStyles.semiBold18White),
                  SizedBox(height: 12.h),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to Near By screen
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                    ),
                    child: Text("Find Near By", style: AppStyles.semiBold16Primary),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetsManager.nurseImage),
        ],
      ),
    );
  }
}
