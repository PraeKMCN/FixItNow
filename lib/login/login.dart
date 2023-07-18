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

import 'package:flutter/material.dart';
import 'package:tes/login/forgotpassword.dart';
import 'package:tes/login/register.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;

                // Perform login logic here
              },
              child: Text('เข้าสู่ระบบ'),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
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

