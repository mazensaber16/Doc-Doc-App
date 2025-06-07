// 📁 see_all_screen_doctors.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/api/api_manager.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/data_source/home/home_remote_data_impl.dart';
import '../../../data/repository/home/home_repo_impl.dart';
import '../../../domain/entity/home/get_specialise_entity.dart';
import '../../../domain/use_case/get_specia_use_case.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/recommende_doctor.dart';
import '../cubit/home_state.dart';
import '../cubit/home_view_model.dart';

class SeeAllScreenDoctors extends StatelessWidget {
  SeeAllScreenDoctors({super.key});

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
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        title: Text(
          "Recommendation Doctor",
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
            ),
          ),
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
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<HomeViewModel, HomeState>(
          bloc: homeViewModel..getSpecialization(),
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            } else if (state is HomeErrorState) {
              return Center(child: Text(state.errorMessage.errorMessage));
            } else if (state is HomeSuccessState) {
              final List<DoctorEntity> doctors = homeViewModel.filteredDoctors.isNotEmpty
                  ? homeViewModel.filteredDoctors
                  : state.getSpecialization
                  .expand<DoctorEntity>((e) => e.doctors ?? [])
                  .toList();
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: CustomTextFormField(
                        hintText: "Search Doctor",
                        filledColor: AppColors.secondWhiteColor,
                        prefixIcon:  Icon(Icons.search, color: AppColors.greyColor),
                       onChanged : (query) {
                          homeViewModel.searchDoctors(query);
                        },
                      ),
                    ),
                    // 🔍 Search Field
                    SizedBox(height: 12.h),

                    RecommendedDoctorsSection(doctors: doctors),
                  ],
                ),
              );
            }
            return const Center(child: Text("Unexpected state"));
          },
        ),
      ),
    );
  }
}
