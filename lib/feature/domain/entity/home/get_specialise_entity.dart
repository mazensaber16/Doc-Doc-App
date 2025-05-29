class GetSpecializationResponseEntity {
  String? message;
  List<SpecializationEntity>? data;

  GetSpecializationResponseEntity({this.message, this.data});


}

class SpecializationEntity {
  int? id;
  String? name;
  List<DoctorEntity>? doctors;

  SpecializationEntity({this.id, this.name, this.doctors});


}

class DoctorEntity {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  SpecializationEntity? specialization;
  CityEntity? city;
  int? appointPrice;
  String? startTime;
  String? endTime;

  DoctorEntity({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });


}

class CityEntity {
  int? id;
  String? name;
  GovernrateEntity? governrate;

  CityEntity({this.id, this.name, this.governrate});


}

class GovernrateEntity {
  int? id;
  String? name;

  GovernrateEntity({this.id, this.name});


}
