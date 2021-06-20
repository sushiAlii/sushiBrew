// import 'package:brew/screens/home/brew_list.dart';
// import 'package:brew/screens/authenticate/sign_in.dart';
// import 'package:brew/screens/home/home.dart';
import 'package:brew/screens/home/home.dart';
import 'package:brew/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:brew/screens/wrapper.dart';
import 'package:brew/services/auth.dart';
import 'package:brew/models/myUser.dart';
import 'package:brew/services/database.dart';
import 'package:brew/screens/authenticate/authenticate.dart';
// import 'package:brew/screens/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        StreamProvider(initialData: null, create: (_) => AuthService().user),
        StreamProvider(
            initialData: null, create: (_) => DatabaseService().brews),
        ChangeNotifierProvider(create: (_) => DatabaseService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        routes: {
          '/authenticate': (context) => Authenticate(),
          '/home': (context) => Home(),
        },
      ),
    );
  }
}
