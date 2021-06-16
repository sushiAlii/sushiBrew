import 'package:brew/screens/home/brew_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:brew/screens/wrapper.dart';
import 'package:brew/services/auth.dart';
import 'package:brew/models/myUser.dart';
import 'package:brew/services/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<MyUser?>.value(
          value: AuthService().user,
          initialData: null,
        ),
        StreamProvider<QuerySnapshot?>.value(
          initialData: null,
          value: DatabaseService().brews,
          builder: (context, child) => BrewList(),
        )
      ],
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
