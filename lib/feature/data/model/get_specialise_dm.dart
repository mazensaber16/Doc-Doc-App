import 'package:doc_doc/feature/domain/entity/home/get_specialise_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GetSpecializationResponseDM extends GetSpecializationResponseEntity{

  GetSpecializationResponseDM({super.message, super.data});

  factory GetSpecializationResponseDM.fromJson(Map<String, dynamic> json) {
    return GetSpecializationResponseDM(
      message: json['message'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SpecializationDM.fromJson(e))
          .toList(),
    );
  }

}

class SpecializationDM extends SpecializationEntity {

  SpecializationDM({super.id, super.name, super.doctors});

  factory SpecializationDM.fromJson(Map<String, dynamic> json) {
    return SpecializationDM(
      id: json['id'],
      name: json['name'],
      doctors: (json['doctors'] as List<dynamic>?)
          ?.map((e) => DoctorDM.fromJson(e))
          .toList(),
    );
  }

}

class DoctorDM extends DoctorEntity {

  DoctorDM({
    super.id,
    super.name,
    super.email,
    super.phone,
    super.photo,
    super.gender,
    super.address,
    super.description,
    super.degree,
    super.specialization,
    super.city,
    super.appointPrice,
    super.startTime,
    super.endTime,
  });

  factory DoctorDM.fromJson(Map<String, dynamic> json) {
    return DoctorDM(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      photo: json['photo'],
      gender: json['gender'],
      address: json['address'],
      description: json['description'],
      degree: json['degree'],
      specialization: json['specialization'] != null
          ? SpecializationDM.fromJson(json['specialization'])
          : null,
      city: json['city'] != null ? CityDM.fromJson(json['city']) : null,
      appointPrice: json['appoint_price'],
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }

}

class CityDM extends CityEntity {

  CityDM({super.id, super.name, super.governrate});

  factory CityDM.fromJson(Map<String, dynamic> json) {
    return CityDM(
      id: json['id'],
      name: json['name'],
      governrate: json['governrate'] != null
          ? GovernrateDM.fromJson(json['governrate'])
          : null,
    );
  }


}

class GovernrateDM extends GovernrateEntity {

  GovernrateDM({super.id, super.name});

  factory GovernrateDM.fromJson(Map<String, dynamic> json) {
    return GovernrateDM(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}
