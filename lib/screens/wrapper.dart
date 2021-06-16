import 'package:brew/screens/authenticate/authenticate.dart';
import 'package:brew/screens/home/home.dart';
import 'package:brew/models/myUser.dart';
import 'package:brew/services/auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();

    // returns either Home or Auth Widget
    if (authService.user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
