import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entity/home/get_specialise_entity.dart';
import 'custom_title_widget.dart';

class RecommendedDoctorsSection extends StatelessWidget {
  final List<DoctorEntity> doctors;

  const RecommendedDoctorsSection({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleWidget(
          title: "Recommendation Doctor",
          onSeeAllTap: () {
            // TODO: Navigate to View All Doctors Screen
          },
          titleStyle: AppStyles.bold17Black,
        ),
        SizedBox(height: 12.h),
        ListView.separated(
          itemCount: doctors.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return InkWell(
              onTap: () {
                // TODO: Navigate to Doctor Details
              },
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
                        Text(doctor.name ?? "", style: AppStyles.bold17Black),
                        SizedBox(height: 4.h),
                        Text(doctor.address ?? "", style: AppStyles.regular16grey),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16.sp),
                            SizedBox(width: 4.w),
                            Text("4.5", style: AppStyles.regular16grey),
                            SizedBox(width: 8.w),
                            Text("10k+ Reviews", style: AppStyles.regular14grey),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
