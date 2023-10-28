import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tes/demo/test.dart';
import 'package:tes/login/login.dart';
import 'package:tes/user/cardwit.dart';
import 'package:tes/login/phoe.dart';
import 'package:tes/profile/profile.dart';
import 'package:tes/demo/re.dart';
import 'package:tes/user/rephone.dart';
import 'package:tes/user/reportForm.dart';
import 'package:tes/user/history.dart';
import 'login/SplashScreen.dart';
import 'demo/home.dart';
import 'login/register.dart';
import 'user/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) => {FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null){
runApp(MaterialApp(
      home: SplashScreen(),
      theme:  ThemeData(
    primaryColor:Color.fromARGB(255, 113, 222, 247), // สีหลัก
    hintColor: Color.fromARGB(255, 139, 140, 139), // สีเน้น
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // ตัวหัวข้อ
      bodyText1: TextStyle(fontSize: 16, color: Colors.black), // ข้อความหลัก
    ),
  ),
      debugShowCheckedModeBanner: false,

    ));
      } else {
        runApp(MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        // colorSchemeSeed: 
        // useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,

    ));
      }
    })});
    
}

// void main(List<String> args) {
//   runApp(MaterialApp(home: SplashScreen(),));
// }



