import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:some_app_firebase/ped_medical_app/model/pet_model.dart';
import 'package:some_app_firebase/ped_medical_app/repository/data_repository.dart';
import 'package:some_app_firebase/ped_medical_app/widgets/add_pet_dialog.dart';
import 'package:some_app_firebase/ped_medical_app/widgets/pet_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DataRepository repository = DataRepository();
  final boldStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pets'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addPet();
        },
        tooltip: 'Add Pet',
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: repository.getStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return _buildList(context, snapshot.data?.docs ?? []);
        },
      ),
    );
  }

  void _addPet() {
    showDialog(context: context, builder: (context) => AddPetDialog());
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: EdgeInsets.only(top: 16),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    final pet = PetModel.fromSnapshot(snapshot);
    return PetCard(
      pet: pet,
      boldStyle: boldStyle,
    );
  }
}
