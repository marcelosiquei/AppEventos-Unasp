import 'package:eventos_unaspht/app/pages/login/signup/login_module.dart';
import 'package:eventos_unaspht/app/shared/constants.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNASP HT',
      theme: ThemeData(
        fontFamily: 'Flexo',
        secondaryHeaderColor: ORANGE,
        primaryColor: BLUE, 
      ),
      debugShowCheckedModeBanner: false,
      home: LoginModule(),
    );
  }
}
