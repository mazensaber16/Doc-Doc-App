class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.data, 
      this.status, 
      this.code,});

  String? message;
  DataEntity? data;
  bool? status;
  int? code;


}

class DataEntity {
  DataEntity({
      this.token, 
      this.username,});

  DataEntity.fromJson(dynamic json) {
    token = json['token'];
    username = json['username'];
  }
  String? token;
  String? username;


}