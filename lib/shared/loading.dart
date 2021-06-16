import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Image(
        image: AssetImage('assets/img/nezuko_run.gif'),
      ),
    );
  }
}
