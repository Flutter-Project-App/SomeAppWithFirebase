import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:some_app_firebase/ped_medical_app/model/vaccination_model.dart';

class PetModel {
  String name;
  String? notes;
  String type;
  List<VaccinationModel> vaccinations;
  String? referenceId;

  PetModel(this.name,
      {this.notes,
      required this.type,
      required this.vaccinations,
      this.referenceId});

  factory PetModel.fromSnapshot(DocumentSnapshot snapshot) {
    final newPet = PetModel.fromJson(snapshot.data() as Map<String, dynamic>);
    newPet.referenceId = snapshot.reference.id;
    return newPet;
  }

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      _petModelFromJson(json);

  Map<String, dynamic> toJson() => _petModelToJson(this);

  @override
  String toString() => 'Pet<$name>';
}

PetModel _petModelFromJson(Map<String, dynamic> json) {
  return PetModel(json['name'] as String,
      notes: json['notes'] as String?,
      type: json['type'] as String,
      vaccinations:
          _convertVaccinations(json['vaccinations'] as List<dynamic>));
}

List<VaccinationModel> _convertVaccinations(List<dynamic> vaccinationMap) {
  final vaccinations = <VaccinationModel>[];

  for (final vaccination in vaccinationMap) {
    vaccinations
        .add(VaccinationModel.fromJson(vaccination as Map<String, dynamic>));
  }
  return vaccinations;
}

Map<String, dynamic> _petModelToJson(PetModel instance) => <String, dynamic>{
      'name': instance.name,
      'notes': instance.notes,
      'type': instance.type,
      'vaccinations': _vaccinationList(instance.vaccinations),
    };

List<Map<String, dynamic>>? _vaccinationList(
    List<VaccinationModel>? vaccinations) {
  if (vaccinations == null) return null;

  final vaccinationMap = <Map<String, dynamic>>[];

  vaccinations.forEach((vaccination) {
    vaccinationMap.add(vaccination.toJson());
  });
  return vaccinationMap;
}
