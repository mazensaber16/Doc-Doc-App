import 'package:dartz/dartz.dart';
import 'package:doc_doc/core/failure/faileures.dart';
import 'package:doc_doc/feature/domain/entity/auth/pages/RegisterResponseEntity.dart';
import 'package:doc_doc/feature/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failure, RegisterResponseEntity>> invoke({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String confirmPassword,
  }) async {
    return await authRepository.register(
      name: name,
      email: email,
      phone: phone,
      gender: gender,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
