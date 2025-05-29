
import 'package:dartz/dartz.dart';
import 'package:doc_doc/core/failure/faileures.dart';
import 'package:doc_doc/feature/domain/entity/home/get_specialise_entity.dart';
import 'package:doc_doc/feature/domain/repository/data_source/home/home_remote.dart';
import 'package:doc_doc/feature/domain/repository/home/home_repo.dart';

class HomeRepoImpl implements HomeRepository{
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, GetSpecializationResponseEntity>> getSpecialization()async{

    var either= await homeRemoteDataSource.getSpecialization();
    return either.fold(
      (error) => Left(error),
      (response) => Right((response)),
    );
  }


}