import 'package:flutter/material.dart';
import 'package:tes/login/login.dart';
import 'package:tes/user/cardwit.dart';
import 'package:tes/login/phoe.dart';
import 'package:tes/user/profile.dart';
import 'package:tes/demo/re.dart';
import 'package:tes/user/rephone.dart';
import 'package:tes/user/reportForm.dart';
import 'package:tes/user/history.dart';
import 'login/SplashScreen.dart';
import 'demo/home.dart';

import 'login/register.dart';
import 'user/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,

    );
  }
}




