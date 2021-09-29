import 'package:flutter/material.dart';
import 'package:some_app_firebase/ped_medical_app/model/pet_model.dart';
import 'package:some_app_firebase/ped_medical_app/model/vaccination_model.dart';

class VaccinationList extends StatelessWidget {
  final PetModel pet;
  final Widget Function(VaccinationModel) buildRow;
  const VaccinationList({Key? key, required this.pet, required this.buildRow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
