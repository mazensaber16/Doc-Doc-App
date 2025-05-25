import 'package:dartz/dartz.dart';
import 'package:doc_doc/core/failure/faileures.dart';
import 'package:doc_doc/feature/domain/entity/auth/pages/LoginResponseEntity.dart';
import 'package:doc_doc/feature/domain/entity/auth/pages/RegisterResponseEntity.dart';
import 'package:doc_doc/feature/domain/repository/auth/auth_repository.dart';
import 'package:doc_doc/feature/domain/repository/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, RegisterResponseEntity>> register(
      {required String name,
        required String email,
        required String phone,
        required String gender,
        required String password,
        required String confirmPassword}) async{
    var either = await authRemoteDataSource.register(
        name: name,
        email: email,
        phone: phone,
        gender: gender,
        password: password,
        confirmPassword: confirmPassword);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failure, LoginResponseEntity>> login({required String email, required String password}) async{
    var either = await authRemoteDataSource.login(

        email: email,
        password: password,
      );
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }
}
