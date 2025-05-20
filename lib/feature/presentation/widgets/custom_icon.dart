import 'package:doc_doc/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcon extends StatelessWidget {
  Widget? image;

  CustomIcon({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.secondWhiteColor,
        ),
        width: 50.w,
        child: image);
  }
}
