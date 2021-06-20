import 'package:brew/screens/authenticate/authenticate.dart';
import 'package:brew/screens/home/home.dart';
// import 'package:brew/services/auth.dart';
import 'package:brew/models/myUser.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final authService = context.read<AuthService>();
    final myUser = Provider.of<MyUser?>(context);
    print("from wrapper! $myUser");

    // returns either Home or Auth Widget
    if (myUser == null) {
      print('User is null');
      return Authenticate();
    } else {
      print('User is not null');
      return Home();
    }
  }
}
