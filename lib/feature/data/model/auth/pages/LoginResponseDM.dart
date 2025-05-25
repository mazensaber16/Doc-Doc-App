import 'package:doc_doc/feature/domain/entity/auth/pages/LoginResponseEntity.dart';

class LoginResponseDm extends LoginResponseEntity {
  LoginResponseDm({
      super.message,
    super.data,
    super.status,
    super.code,});

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataLoginDM.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }



}

class DataLoginDM extends DataLoginEntity {
  DataLoginDM({
      super.token,
    super.username,});

  DataLoginDM.fromJson(dynamic json) {
    token = json['token'];
    username = json['username'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['username'] = username;
    return map;
  }

}