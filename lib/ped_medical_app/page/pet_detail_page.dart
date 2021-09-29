import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:some_app_firebase/ped_medical_app/model/category_option_model.dart';
import 'package:some_app_firebase/ped_medical_app/model/pet_model.dart';
import 'package:some_app_firebase/ped_medical_app/model/vaccination_model.dart';
import 'package:some_app_firebase/ped_medical_app/widgets/choose_chips.dart';
import 'package:some_app_firebase/ped_medical_app/widgets/user_text_field.dart';
import 'package:some_app_firebase/ped_medical_app/widgets/vaccination_list.dart';

class PetDetail extends StatefulWidget {
  final PetModel pet;
  const PetDetail({Key? key, required this.pet}) : super(key: key);

  @override
  _PetDetailState createState() => _PetDetailState();
}

class _PetDetailState extends State<PetDetail> {
  final _formKey = GlobalKey<FormState>();
  final dateFormat = DateFormat('dd-MM-yyyy');
  late List<CategoryOption> animalTypes;
  late String name;
  late String type;
  String? notes;

  @override
  void initState() {
    type = widget.pet.type;
    name = widget.pet.name;
    animalTypes = [
      CategoryOption(type: 'cat', name: 'Cat', isSelected: type == 'cat'),
      CategoryOption(type: 'dog', name: 'Dog', isSelected: type == 'dog'),
      CategoryOption(type: 'other', name: 'Other', isSelected: type == 'other'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      height: double.infinity,
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              UserTextField(
                  name: 'Pet Name',
                  initialValue: widget.pet.name,
                  inputType: TextInputType.name,
                  onChanged: (value) => name = value ?? name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please input name';
                    } else {
                      return null;
                    }
                  }),
              ChooseType(
                  title: 'Animal Type',
                  options: animalTypes,
                  onOptionTap: (value) {
                    setState(() {
                      animalTypes.forEach((element) {
                        type = value.type;
                        element.isSelected = element.type == value.type;
                      });
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              UserTextField(
                  name: 'Notes',
                  initialValue: widget.pet.notes ?? '',
                  inputType: TextInputType.text,
                  onChanged: (value) => notes = value,
                  validator: (value) {}),
              VaccinationList(pet: widget.pet, buildRow: buildRow),
              FloatingActionButton(onPressed: () {

              }),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(VaccinationModel vaccination) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(vaccination.vaccination)),
        Text(dateFormat.format(vaccination.date)),
        Checkbox(
            value: vaccination.done ?? false,
            onChanged: (newValue) {
              setState(() {
                vaccination.done = newValue;
              });
            })
      ],
    );
  }
}
