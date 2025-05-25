import 'package:dartz/dartz.dart';
import 'package:doc_doc/core/failure/faileures.dart';
import 'package:doc_doc/feature/domain/entity/auth/pages/LoginResponseEntity.dart';
import 'package:doc_doc/feature/domain/entity/auth/pages/RegisterResponseEntity.dart';
import 'package:doc_doc/feature/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failure, LoginResponseEntity>> invoke({
    required String email,
    required String password,

  }) async{
   return await authRepository.login(email: email, password: password);
  }
}