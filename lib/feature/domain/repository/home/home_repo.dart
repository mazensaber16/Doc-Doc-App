
 import 'package:dartz/dartz.dart';
import 'package:doc_doc/core/failure/faileures.dart';

import '../../entity/home/get_specialise_entity.dart';

abstract class HomeRepository {

  Future<Either<Failure, GetSpecializationResponseEntity>> getSpecialization();
}