import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'custom_icon.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Mazen!", style: AppStyles.bold20Black),
            Text("How Are you Today?", style: AppStyles.regular16grey),
          ],
        ),
        CustomIcon(
          image: Icon(
            Icons.notifications,
            color: AppColors.secondGreyColor,
            size: 33.sp,
          ),
        ),
      ],
    );
  }
}