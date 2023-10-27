// import 'package:flutter/material.dart';
// import 'register.dart';
// import 'forgotpassword.dart';
// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('เข้าสู่ระบบ'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'อีเมล',
//                 prefixIcon: Icon(Icons.email),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'รหัสผ่าน',
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text('เข้าสู่ระบบ'),
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => RegisterPage()),);
//                   },
//                   child: Text('ลงทะเบียน'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
//                   },
//                   child: Text('ลืมรหัสผ่าน'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tes/login/forgotpassword.dart';
import 'package:tes/login/register.dart';
import 'package:tes/user/homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    
    super.initState();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เข้าสู่ระบบ'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'อีเมล',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'รหัสผ่าน',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: 200,
              child: FilledButton(
                onPressed: () {
                  FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                )
                    .then((value) {
                  //--------- การสมัครสำเร็จ --------------
                    //-------เพิ่มชื่อผู้ใช้งานระบบ 
        
                  Widget okButton = TextButton(
                    child: Text("ตกลง"),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  );
        
                  // set up the AlertDialog
                  AlertDialog alert = AlertDialog(
                    title: Text("เข้าสู่ระบบสำเร็จ"),
                    content: Text("กดปุ่ม 'ตกลง' เพื่อไปหน้าเข้าสู่ระบบ"),
                    actions: [
                      okButton,
                    ],
                  );
        
                  // show the dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                }).catchError((error) {
                  //---------- เกิดข้อผิดพลาดในการสมัคร -----------------
                  print(error.hashCode);
                  var errorTxt = "";
                  switch (error.hashCode) {
                    case 461740379:
                      {
                        errorTxt = "อีเมลซ้ำ กรุณาตรวจสอบ";
                      }
                      break;
                    case 240054626:
                      {
                        errorTxt = "รูปแบบอีเมลไม่ถูกต้อง";
                      }
                      break;
                    default:
                      {
                        errorTxt = error.toString();
                      }
                      break;
                  }
        
                  SnackBar snackBar =
                      SnackBar(content: Text("เกิดข้อผิดพลาด : " + errorTxt));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
                  // String email = emailController.text;
                  // String password = passwordController.text;
            
                  // Perform login logic here
                },
                child: Text('เข้าสู่ระบบ'),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => register()),
                    );
                  },
                  child: Text('ลงทะเบียน'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                    );
                  },
                  child: Text('ลืมรหัสผ่าน'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

