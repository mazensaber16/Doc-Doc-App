import 'package:dartz/dartz.dart';
import 'package:doc_doc/core/failure/faileures.dart';
import 'package:doc_doc/feature/domain/entity/auth/pages/LoginResponseEntity.dart';
import 'package:doc_doc/feature/domain/entity/auth/pages/RegisterResponseEntity.dart';

abstract class AuthRemoteDataSource{

  Future<Either<Failure,RegisterResponseEntity>>register({

    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String confirmPassword,

  });
  Future<Either<Failure,LoginResponseEntity>>login({

    required String email,
    required String password,
  });

}