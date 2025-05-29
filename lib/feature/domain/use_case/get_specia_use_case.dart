
import 'package:dartz/dartz.dart';

import '../../../core/failure/faileures.dart';
import '../entity/home/get_specialise_entity.dart';
import '../repository/home/home_repo.dart';

class GetSpecialiseUseCase{

   HomeRepository homeRepository;
  GetSpecialiseUseCase({required this.homeRepository});

  Future<Either<Failure, GetSpecializationResponseEntity>>invoke()async{
    return await homeRepository.getSpecialization();
  }
}