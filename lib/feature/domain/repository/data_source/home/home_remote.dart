
import 'package:dartz/dartz.dart';

import '../../../../../core/failure/faileures.dart';
import '../../../entity/home/get_specialise_entity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, GetSpecializationResponseEntity>> getSpecialization();

}