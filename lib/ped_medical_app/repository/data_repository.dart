import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:some_app_firebase/ped_medical_app/model/pet_model.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('pets');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> addPet(PetModel pet) {
    return collection.add(pet.toJson());
  }

  void updatePet(PetModel pet) async {
    await collection.doc(pet.referenceId).update(pet.toJson());
  }

  void deletePet(PetModel pet) async {
    await collection.doc(pet.referenceId).delete();
  }
}
