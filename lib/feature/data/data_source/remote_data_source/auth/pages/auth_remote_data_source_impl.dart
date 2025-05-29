import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:doc_doc/core/api/api_constant.dart';
import 'package:doc_doc/core/api/api_manager.dart';
import 'package:doc_doc/core/failure/faileures.dart';
import 'package:doc_doc/feature/data/model/auth/pages/LoginResponseDM.dart';
import 'package:doc_doc/feature/data/model/auth/pages/RegisterResponseDM.dart';
import 'package:doc_doc/feature/domain/repository/data_source/remote_data_source/auth_remote_data_source.dart';

import 'package:injectable/injectable.dart';

import '../../../../../../core/cache/shared_preference_utils.dart';

@Injectable(as:AuthRemoteDataSource )
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failure, RegisterResponseDm>> register(
      {required String name,
        required String email,
        required String phone,
        required String gender,
        required String password,
        required String confirmPassword
      })
  async {
    try {
      final List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(
          endPoint: ApiConstants.registerEndPoint,
          body: {
            "name": name,
            "email": email,
            "phone": phone,
            "gender": gender,
            "password": password,
            "password_confirmation": confirmPassword,
          },
        );
        var registerResponse = RegisterResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMessage: registerResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      print(e.toString());
      return Left(ServerError(errorMessage: e.toString()));

    }
  }

  @override
  Future<Either<Failure, LoginResponseDm>> login(
      {required String email, required String password})async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
       var token= SharedPreferenceUtils.saveData(key: "token", value: ApiConstants.tokenApi);
        print(token);

        var response = await apiManager.postData(
          endPoint: ApiConstants.loginEndPoint,
          body: {
            "email": email,
            "password": password,
          },
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          }
        );
        var loginResponse = LoginResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(ServerError(errorMessage: loginResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
