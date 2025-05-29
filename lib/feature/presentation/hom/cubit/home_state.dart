
import 'package:doc_doc/core/failure/faileures.dart';
import 'package:doc_doc/feature/domain/entity/home/get_specialise_entity.dart';

abstract class HomeState{}

class HomeInitialState extends HomeState {}
class HomeLoadingState extends HomeState {}
class HomeSuccessState extends HomeState {

List<SpecializationEntity> getSpecialization;
  HomeSuccessState({required this.getSpecialization});
}
class HomeErrorState extends HomeState {
  Failure errorMessage;
  HomeErrorState({required this.errorMessage});
}