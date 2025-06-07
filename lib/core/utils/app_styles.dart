import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle medium36Text = GoogleFonts.poppins(
      fontSize: 36, fontWeight: FontWeight.w400, color: AppColors.whiteColor);
  static TextStyle regular16grey = GoogleFonts.inter(
      fontSize: 10.sp, fontWeight: FontWeight.w700, color: AppColors.secondGreyColor);
  static TextStyle green16grey = GoogleFonts.inter(
      fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.greenColor);
  static TextStyle regular14grey = GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.secondGreyColor);


  static TextStyle regular20Grey = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w200, color: AppColors.greyColor);
  static TextStyle regular16textGrey = GoogleFonts.inter(
      fontSize: 16, color: AppColors.textColor);

  static TextStyle regular20White = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static TextStyle regular23White = GoogleFonts.poppins(
      fontSize: 23, fontWeight: FontWeight.normal, color: AppColors.whiteColor);
  static TextStyle regular14White = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.normal, color: AppColors.greyColor);
  static TextStyle bold24White = GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.w200, color: AppColors.whiteColor);

  static TextStyle semiBold20Black = GoogleFonts.poppins(
      fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColors.blackColor);
  static TextStyle bold20Black = GoogleFonts.inter(
      fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.blackColor);
  static TextStyle bold17Black = GoogleFonts.inter(
      fontSize: 17.sp, fontWeight: FontWeight.bold, color: AppColors.blackColor);
  static TextStyle semiBold16Black = GoogleFonts.poppins(
      fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.blackColor);
  static TextStyle semiBold16Primary = GoogleFonts.inter(
      fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.primaryColor);
  static TextStyle semiBold13Primary = GoogleFonts.inter(
      fontSize: 13.sp, fontWeight: FontWeight.w400, color: AppColors.primaryColor);
  static TextStyle semiBold18White = GoogleFonts.poppins(
      fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.whiteColor);

  static TextStyle bol14yellow = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryColor);

  static TextStyle semiBold20primary = GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.primaryColor);
  static TextStyle semiBold16white = GoogleFonts.inter(
      fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.whiteColor);
  static TextStyle semiBold17Yellow = GoogleFonts.poppins(
      fontSize: 17, fontWeight: FontWeight.w500, color: AppColors.primaryColor);
  static TextStyle bold32primary = GoogleFonts.inter(
      fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryColor);
}
