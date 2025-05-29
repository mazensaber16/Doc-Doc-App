
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:doc_doc/core/api/api_manager.dart';
import 'package:doc_doc/core/failure/faileures.dart';
import 'package:doc_doc/feature/data/model/get_specialise_dm.dart';
import 'package:doc_doc/feature/domain/entity/home/get_specialise_entity.dart';
import 'package:doc_doc/feature/domain/repository/data_source/home/home_remote.dart';

import '../../../../core/api/api_constant.dart';
import '../../../../core/cache/shared_preference_utils.dart';

class HomeRemoteDataImpl implements HomeRemoteDataSource{
  ApiManager apiManager;
  HomeRemoteDataImpl({required this.apiManager});
  @override
  Future<Either<Failure, GetSpecializationResponseDM>> getSpecialization()async {

    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        final token = SharedPreferenceUtils.getData(key: "token");
        print("Token: $token");
        var response = await apiManager.getData(
          endPoint: ApiConstants.getSpecializationEndPoint,
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          }

        );
        var getSpecialiseResponse = GetSpecializationResponseDM.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getSpecialiseResponse);
        } else {
          return Left(ServerError(errorMessage: getSpecialiseResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }

  }

}