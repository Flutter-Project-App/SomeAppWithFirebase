import 'package:flutter/material.dart';
import 'package:some_app_firebase/ped_medical_app/model/pet_model.dart';
import 'package:some_app_firebase/ped_medical_app/model/vaccination_model.dart';
import 'package:some_app_firebase/ped_medical_app/widgets/date_picker.dart';
import 'package:some_app_firebase/ped_medical_app/widgets/user_text_field.dart';
import 'package:some_app_firebase/ped_medical_app/widgets/vaccinated_check_box.dart';

class AddVaccinationPage extends StatefulWidget {
  final PetModel pet;
  final Function callback;
  const AddVaccinationPage(
      {Key? key, required this.pet, required this.callback})
      : super(key: key);

  @override
  _AddVaccinationPageState createState() => _AddVaccinationPageState();
}

class _AddVaccinationPageState extends State<AddVaccinationPage> {
  final _formKey = GlobalKey<FormState>();

  late PetModel pet;
  var done = false;
  var vaccination = '';
  late DateTime vaccinationDate;

  @override
  void initState() {
    pet = widget.pet;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Vaccination'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              UserTextField(
                  name: 'vaccination',
                  initialValue: '',
                  inputType: TextInputType.text,
                  onChanged: (value) {
                    if (value != null) {
                      vaccination = value;
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the Vaccination Name';
                    } else {
                      return null;
                    }
                  }),
              DatePicker(
                name: 'Date',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter the Vaccination Date';
                  } else {
                    return null;
                  }
                },
                onChanged: (text) {
                  vaccinationDate = text;
                },
              ),
              VaccinatedCheckbox(
                  name: 'Given',
                  value: done,
                  onChanged: (text) {
                    done = text ?? done;
                  })
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                Navigator.of(context).pop();
                final newVaccination = VaccinationModel(vaccination,
                    date: vaccinationDate, done: done);
                pet.vaccinations.add(newVaccination);
              }
              widget.callback();
            },
            child: Text('Add')),
      ],
    );
  }
}
