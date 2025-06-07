// 📁 home_tab.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/api/api_manager.dart';
import '../../../../../core/utils/app_colors.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../data/data_source/home/home_remote_data_impl.dart';
import '../../../../data/repository/home/home_repo_impl.dart';
import '../../../../domain/entity/home/get_specialise_entity.dart';
import '../../../../domain/use_case/get_specia_use_case.dart';
import '../../../widgets/booking_banner.dart';
import '../../../widgets/custom_title_widget.dart';
import '../../../widgets/doctor_specialist.dart';
import '../../../widgets/home_header.dart';
import '../../../widgets/recommende_doctor.dart';
import '../../cubit/home_state.dart';
import '../../cubit/home_view_model.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

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
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            } else if (state is HomeErrorState) {
              return Center(child: Text(state.errorMessage.errorMessage));
            } else if (state is HomeSuccessState) {
              final specialities = state.getSpecialization;
              final List<DoctorEntity> doctors = specialities
                  .expand<DoctorEntity>((e) => e.doctors ?? <DoctorEntity>[])
                  .toList();

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeHeader(),
                    SizedBox(height: 16.h),
                    const BookingBanner(),
                    SizedBox(height: 24.h),
                    DoctorSpecialitiesSection(specialities: specialities),
                    SizedBox(height: 24.h),
                    CustomTitleWidget(
                      title: "Recommendation Doctor",
                      onSeeAllTap: () {
                        // TODO: Navigate to View All Doctors Screen
                        Navigator.pushNamed(context, AppRoutes.seeAllDoctors);
                      },
                      titleStyle: AppStyles.bold17Black,
                    ),
                    SizedBox(height: 12.h),
                    RecommendedDoctorsSection(doctors:doctors),
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

