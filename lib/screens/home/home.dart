import 'package:brew/services/auth.dart';
import 'package:brew/services/database.dart';
import 'package:brew/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:brew/screens/home/brew_list.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  // const Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService().brews,
      initialData: [],
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text("Sushi Brew"),
          backgroundColor: Colors.brown[500],
          actions: <Widget>[
            TextButton.icon(
              onPressed: () async {
                dynamic result = await _auth.signOut();
                print(result);
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
