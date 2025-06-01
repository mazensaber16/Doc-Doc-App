import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entity/home/get_specialise_entity.dart';
import 'custom_title_widget.dart';

class DoctorSpecialitiesSection extends StatelessWidget {
  final List<SpecializationEntity> specialities;

  const DoctorSpecialitiesSection({super.key, required this.specialities});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleWidget(
          title: "Doctor Speciality",
          onSeeAllTap: () {
            // TODO: Navigate to View All Specialities Screen
          },
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: 100.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: specialities.length,
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final item = specialities[index];
              return InkWell(
                onTap: () {
                  // TODO: Navigate Specialities Screen
                },
                child: Column(
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondWhiteColor,
                        image: DecorationImage(
                          image: AssetImage(AssetsManager.brainImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(item.name ?? '', style: AppStyles.semiBold16Black),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
