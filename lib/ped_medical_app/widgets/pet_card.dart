import 'package:flutter/material.dart';
import 'package:some_app_firebase/ped_medical_app/model/pet_model.dart';
import 'package:some_app_firebase/ped_medical_app/page/pet_room_page.dart';
import 'package:some_app_firebase/ped_medical_app/utils/pets_icons.dart';

class PetCard extends StatelessWidget {
  final PetModel pet;
  final TextStyle boldStyle;
  final splashColor = {
    'cat': Colors.pink.shade100,
    'dog': Colors.blue.shade100,
    'other': Colors.grey.shade100,
  };

  PetCard({Key? key, required this.pet, required this.boldStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                pet.name,
                style: boldStyle,
              ),
            )),
            _getPetIcon(pet.type)
          ],
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PetRoomPage(pet: pet))),
        splashColor: splashColor[pet.type],
      ),
    );
  }

  Widget _getPetIcon(String type) {
    Widget petIcon;
    switch (type) {
      case 'cat':
        petIcon = IconButton(
            onPressed: () {},
            icon: Icon(
              Pets.cat,
              color: Colors.pinkAccent,
            ));
        break;
      case 'dog':
        petIcon = IconButton(
            onPressed: () {},
            icon: Icon(
              Pets.dog_seating,
              color: Colors.blueAccent,
            ));
        break;
      default:
        petIcon = IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.pets,
              color: Colors.blueGrey,
            ));
    }
    return petIcon;
  }
}
