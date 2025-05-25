import 'package:doc_doc/feature/domain/entity/auth/pages/RegisterResponseEntity.dart';

class RegisterResponseDm extends RegisterResponseEntity {
  RegisterResponseDm({
      super.message,
    super.data,
    super.status,
    super.code,});

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataDM.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }

}

class DataDM extends DataEntity{
  DataDM({
    super.token,
    super.username,});

  DataDM.fromJson(dynamic json) {
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