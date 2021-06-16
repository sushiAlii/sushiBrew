import 'package:brew/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:brew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brew/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      initialData: null,
      value: DatabaseService().brews,
      builder: (context, child) {
        return BrewList();
      },
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text("Sushi Brew"),
          backgroundColor: Colors.brown[500],
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
