import 'package:brew/models/brew.dart';
// import 'package:brew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:brew/models/myUser.dart';
import 'package:brew/screens/home/brew_tile.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    // final myUser = Provider.of<MyUser?>(context);
    // String uid = myUser!.uid;
    final brews = Provider.of<List<Brew>?>(context) ?? [];
    // print('From Brew List $myUser');

    return ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context, index) {
          return BrewTile(
            brew: brews[index],
          );
        });
  }
}
