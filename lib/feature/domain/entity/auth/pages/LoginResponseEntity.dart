class LoginResponseEntity {
  LoginResponseEntity({
      this.message, 
      this.data, 
      this.status, 
      this.code,});

  String? message;
  DataLoginEntity? data;
  bool? status;
  int? code;


}

class DataLoginEntity {
  DataLoginEntity({
      this.token, 
      this.username,});

  String? token;
  String? username;


}