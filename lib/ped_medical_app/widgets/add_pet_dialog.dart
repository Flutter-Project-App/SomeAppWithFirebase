import 'package:flutter/material.dart';
import 'package:some_app_firebase/ped_medical_app/model/pet_model.dart';
import 'package:some_app_firebase/ped_medical_app/repository/data_repository.dart';

class AddPetDialog extends StatefulWidget {
  const AddPetDialog({Key? key}) : super(key: key);

  @override
  _AddPetDialogState createState() => _AddPetDialogState();
}

class _AddPetDialogState extends State<AddPetDialog> {
  String? petName;
  String character = '';

  final DataRepository repository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Pets'),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a Pet Name'),
              onChanged: (text) => petName = text,
            ),
            RadioListTile(
                title: Text('Cat'),
                value: 'cat',
                groupValue: character,
                onChanged: (value) {
                  setState(() {
                    character = (value ?? '').toString();
                  });
                }),
            RadioListTile(
                title: Text('Dog'),
                value: 'dog',
                groupValue: character,
                onChanged: (value) {
                  setState(() {
                    character = (value ?? '').toString();
                  });
                }),
            RadioListTile(
                title: Text('Other'),
                value: 'other',
                groupValue: character,
                onChanged: (value) {
                  setState(() {
                    character = (value ?? '').toString();
                  });
                })
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel')),
        TextButton(onPressed: () {
          if (petName != null && character.isNotEmpty) {
            final newPet = PetModel(petName!, type: character, vaccinations: []);
            repository.addPet(newPet);
          }
          Navigator.of(context).pop();
        }, child: Text('Add')),
      ],
    );
  }
}
