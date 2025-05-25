


import 'package:doc_doc/core/failure/faileures.dart';
import 'package:doc_doc/feature/domain/entity/auth/pages/RegisterResponseEntity.dart';

class RegisterStates {}

final class RegisterInitial extends RegisterStates {}
final class RegisterLoadingState extends RegisterStates {}
final class RegisterErrorState extends RegisterStates {

  Failure error;
  RegisterErrorState({required this.error});
}
final class RegisterSuccessState extends RegisterStates {

  RegisterResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});
}
