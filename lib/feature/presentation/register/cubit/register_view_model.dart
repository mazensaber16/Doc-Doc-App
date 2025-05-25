import 'package:doc_doc/feature/domain/use_case/register_use_case.dart';
import 'package:doc_doc/feature/presentation/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  final RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase}) : super(RegisterInitial());

  // تهيئة الكونترولرات بدون قيم افتراضية (اختياري)
  TextEditingController fullNameController = TextEditingController(text: "Mazen");
  TextEditingController phoneController = TextEditingController(text: "1126095774");
  TextEditingController emailController = TextEditingController(text: "mazenSaber44@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "mazenSaber44#");
  TextEditingController confirmPasswordController = TextEditingController(text: "mazenSaber44#");
  TextEditingController genderController = TextEditingController(text: "0");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> register() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(RegisterLoadingState());
      final either = await registerUseCase.invoke(
        name: fullNameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        gender: genderController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
      );

      either.fold(
            (error) => emit(RegisterErrorState(error: error)),
            (response) => emit(RegisterSuccessState(registerResponseEntity: response)),
      );
    }
  }
}