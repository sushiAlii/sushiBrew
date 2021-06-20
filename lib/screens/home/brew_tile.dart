import 'package:flutter/material.dart';
import 'package:brew/models/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({required this.brew});

  @override
  Widget build(BuildContext context) {
    String sugars = brew.sweetness!;
    if (brew.sweetness == '0') {
      sugars = 'no';
    }
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.brown[brew.strength!],
            ),
            title: Text(brew.name!),
            subtitle: Text('Wants $sugars sugars'),
          ),
        ));
  }
}
