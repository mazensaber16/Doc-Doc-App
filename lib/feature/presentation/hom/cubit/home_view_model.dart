import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/home/get_specialise_entity.dart';
import '../../../domain/use_case/get_specia_use_case.dart';
import 'home_state.dart';

class HomeViewModel extends Cubit<HomeState> {
  final GetSpecialiseUseCase getSpecialiseUseCase;

  HomeViewModel({required this.getSpecialiseUseCase}) : super(HomeInitialState());

  List<SpecializationEntity> getSpecializationList = [];
  List<DoctorEntity> allDoctors = []; // ← كل الدكاترة في التطبيق
  List<DoctorEntity> filteredDoctors = [];

  void getSpecialization() async {
    emit(HomeLoadingState());
    var either = await getSpecialiseUseCase.invoke();

    either.fold(
          (error) {
        emit(HomeErrorState(errorMessage: error));
        print("❌ Error fetching specialization: ${error.errorMessage}");
      },
          (response) {
        getSpecializationList = response.data ?? [];

        // استخراج كل الدكاترة من جميع التخصصات (تجميع)
         allDoctors = getSpecializationList
            .expand<DoctorEntity>((specialization) => specialization.doctors ?? [])
            .toList();

        filteredDoctors = allDoctors;

        emit(HomeSuccessState(
          getSpecialization: getSpecializationList,
          filteredDoctors: filteredDoctors,
        ));
      },
    );
  }

  void searchDoctors(String query) {
    if (query.isEmpty) {
      filteredDoctors = allDoctors;
    } else {
      filteredDoctors = allDoctors.where((doctor) {
        return doctor.name!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }

    emit(HomeSuccessState(
      getSpecialization: getSpecializationList,
      filteredDoctors: filteredDoctors,
    ));
  }
}
