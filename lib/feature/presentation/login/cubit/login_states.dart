import 'package:doc_doc/core/failure/faileures.dart';
import 'package:doc_doc/feature/domain/entity/auth/pages/LoginResponseEntity.dart';


class LoginState{}

class LoginInitialState extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {
 LoginResponseEntity loginResponseEntity;
 LoginSuccessState({required this.loginResponseEntity});
}
class LoginErrorState extends LoginState {
   Failure error;
   LoginErrorState({required this.error});
}
class LoginCheckboxToggledState extends LoginState {
  final bool isChecked;

  LoginCheckboxToggledState({required this.isChecked});
}