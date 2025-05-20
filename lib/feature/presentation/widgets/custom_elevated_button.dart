import 'package:auto_size_text/auto_size_text.dart';
import 'package:doc_doc/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  String ?text;
  Color backgroundColor;
  TextStyle? textStyle;
  void Function()? onPressed;

  CustomElevatedButton(
      {super.key,
     this.text,
      required this.onPressed,
      required this.backgroundColor,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),

        ),
      ),
      child: SizedBox(
        height: 55.h,
        width: 340.w,
        child: Center(
          child: AutoSizeText(text??"", style: textStyle??AppStyles.semiBold16white),
        ),
      ),
    );
  }
}
