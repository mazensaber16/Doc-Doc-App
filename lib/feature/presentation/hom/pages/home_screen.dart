import 'package:doc_doc/core/api/api_manager.dart';
import 'package:doc_doc/core/utils/app_assets.dart';
import 'package:doc_doc/core/utils/app_colors.dart';
import 'package:doc_doc/core/utils/app_styles.dart';
import 'package:doc_doc/feature/data/data_source/home/home_remote_data_impl.dart';
import 'package:doc_doc/feature/data/repository/home/home_repo_impl.dart';
import 'package:doc_doc/feature/presentation/hom/cubit/home_state.dart';
import 'package:doc_doc/feature/presentation/hom/cubit/home_view_model.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_icon.dart';
import 'package:doc_doc/feature/presentation/widgets/custom_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/use_case/get_specia_use_case.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeViewModel homeViewModel = HomeViewModel(
    getSpecialiseUseCase: GetSpecialiseUseCase(
      homeRepository: HomeRepoImpl(
        homeRemoteDataSource: HomeRemoteDataImpl(
          apiManager: ApiManager(),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeViewModel, HomeState>(
          bloc: homeViewModel..getSpecialization(),
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            } else if (state is HomeErrorState) {
              return Center(
                child: Text(state.errorMessage.errorMessage),
              );
            } else if (state is HomeSuccessState) {
              final doctorSpecialitiesList = state.getSpecialization.map((specialization) => {
                'name': specialization.name,
              }).toList();

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
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
                      ),

                      SizedBox(height: 16.h),

                      // Booking Banner
                      Container(
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
                                    Text(
                                      "Book and \nschedule with \nnearest doctor",
                                      style: AppStyles.semiBold18White,
                                    ),
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
                      ),

                      SizedBox(height: 24.h),

                      // Doctor Speciality Section
                      CustomTitleWidget(
                        title: "Doctor Speciality",
                        onSeeAllTap: () {
                          //Todo : Navigate to View All Specialities Screen
                        },
                      ),
                      SizedBox(height: 18.h),

                      SizedBox(
                        height: 100.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: doctorSpecialitiesList.length,
                          separatorBuilder: (context, index) => SizedBox(width: 16.w),
                          itemBuilder: (context, index) {
                            final item = doctorSpecialitiesList[index];
                            return Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  //Todo : Navigate Specialities Screen
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: 60.w,
                                      height: 60.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.secondWhiteColor,
                                        image: DecorationImage(
                                          image: AssetImage(AssetsManager.facebookIcon),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      item['name'] ?? '',
                                      style: AppStyles.semiBold16Black,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 23.h),

                      // Recommendation Section
                      CustomTitleWidget(
                        title: "Recommendation Doctor",
                        onSeeAllTap: () {
                          //Todo : Navigate to View All Doctors Screen
                        },
                        titleStyle: AppStyles.bold17Black,
                      ),
                      SizedBox(height: 12.h),
                      ListView.separated(
                        itemCount: 10,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => SizedBox(height: 16.h),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: InkWell(
                              onTap: () {
                                //Todo : Navigate to Doctor Details
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 120.w,
                                    height: 110.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage(AssetsManager.doctorImage),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Dr. Randy Wigham", style: AppStyles.bold17Black),
                                        SizedBox(height: 4.h),
                                        Text(
                                          "General | RSUD Gatot Subroto",
                                          style: AppStyles.regular16grey,
                                        ),
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
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }

            return Center(child: Text("Unexpected state"));
          },
        ),
      ),
    );
  }
}
