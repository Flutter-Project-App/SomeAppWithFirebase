import 'package:cloud_firestore/cloud_firestore.dart';

class VaccinationModel {
  final String vaccination;
  final DateTime date;
  bool? done;

  VaccinationModel(this.vaccination, {required this.date, required this.done});

  factory VaccinationModel.fromJson(Map<String, dynamic> json) =>
      _vaccinationModelFromJson(json);

  Map<String, dynamic> toJson() => _vaccinationModelToJson(this);

  @override
  String toString() => 'VaccinationModel<$vaccination>';
}

VaccinationModel _vaccinationModelFromJson(Map<String, dynamic> json) {
  return VaccinationModel(json['vaccination'] as String,
      date: (json['date'] as Timestamp).toDate(), done: json['done'] as bool);
}

Map<String, dynamic> _vaccinationModelToJson(VaccinationModel instance) =>
    <String, dynamic>{
      'vaccination': instance.vaccination,
      'date': instance.date,
      'done': instance.done,
    };
