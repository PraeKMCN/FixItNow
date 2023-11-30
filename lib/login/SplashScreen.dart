// import 'package:flutter/material.dart';
// import 'package:tes/login/register.dart';
// import 'login.dart';
// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 16.0),
//             Image.asset("assets/img.jpg"),
//             CircularProgressIndicator(),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginPage()),
//                 );
//               },
//               child: Text('เข้าสู่ระบบ'),
//             ),
//  SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => register()),
//                 );
//               },
//               child: Text('ลงทะเบียน'),
//             )
//           ],
//         ),
//       ),
      
//     );
//   }
// }   
//////////////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:tes/login/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // เพิ่มเงื่อนไขหรือใช้ Future.delayed() เพื่อรอเวลา
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/sp.jpg",
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo/lo.png", // เพิ่มตำแหน่งโลโก้ของคุณ
                  height: 500, // ปรับความสูงตามที่คุณต้องการ
                  width: 500, // ปรับความกว้างตามที่คุณต้องการ
                ),
                SizedBox(height: 16.0),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
