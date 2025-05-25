import 'package:doc_doc/feature/domain/use_case/login_use_case.dart';
import 'package:doc_doc/feature/presentation/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());

  TextEditingController mailController = TextEditingController(text: "mazenSaber44@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "mazenSaber44#");

  var formKey = GlobalKey<FormState>();

  bool isRememberMeChecked = false;

  void toggleRememberMe(bool? value) {
    isRememberMeChecked = value ?? false;
    emit(LoginCheckboxToggledState(isChecked: isRememberMeChecked));
  }

  void login() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
      email: mailController.text,
      password: passwordController.text,
    );

    either.fold(
          (error) => emit(LoginErrorState(error: error)),
          (response) => emit(LoginSuccessState(loginResponseEntity: response)),
    );
  }
}
