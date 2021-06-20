import 'package:brew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService with ChangeNotifier {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Stream<QuerySnapshot> streamBrewCollection =
      FirebaseFirestore.instance.collection('brews').snapshots();

  Future updateUserData(String sweetness, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sweetness': sweetness,
      'name': name,
      'strength': strength,
    });
  }

  //  BREW GETTER
  Stream<List<Brew>> get brews {
    return streamBrewCollection.map((_brewListFromSnapshot));
  }

  //  Brew List from Snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot streamBrewCollection) {
    return streamBrewCollection.docs.map((doc) {
      return Brew(
          name: doc.get('name') ?? '',
          sweetness: doc.get('sweetness') ?? '0',
          strength: doc.get('strength') ?? 0);
    }).toList();
  }
}
