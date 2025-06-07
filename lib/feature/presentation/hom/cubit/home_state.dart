import 'package:doc_doc/core/failure/faileures.dart';
import 'package:doc_doc/feature/domain/entity/home/get_specialise_entity.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<SpecializationEntity> getSpecialization;
  final List<DoctorEntity> filteredDoctors;

  HomeSuccessState({
    required this.getSpecialization,
    required this.filteredDoctors,
  });
}

class HomeErrorState extends HomeState {
  final Failure errorMessage;

  HomeErrorState({required this.errorMessage});
}
