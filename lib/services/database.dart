import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sweetness, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sweetness': sweetness,
      'name': name,
      'strength': strength,
    });
  }

  //  BREW GETTER
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
