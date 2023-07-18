// import 'package:flutter/material.dart';
// import 'package:tes/login/forgotpassword.dart';
// import 'package:tes/login/register.dart';

// class LoginPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

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
//             TextFormField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'อีเมล',
//                 prefixIcon: Icon(Icons.email),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'รหัสผ่าน',
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 String email = emailController.text;
//                 String password = passwordController.text;

//                 // Perform login logic here
//               },
//               child: Text('เข้าสู่ระบบ'),
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => RegisterPage()),
//                     );
//                   },
//                   child: Text('ลงทะเบียน'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
//                     );
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

///////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'register.dart';
// import 'forgotpassword.dart';

// class LoginPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   Future<UserCredential> signInWithGoogle() async {
//     final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
//     final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount!.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );

//     return await _auth.signInWithCredential(credential);
//   }

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
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'อีเมล',
//                 prefixIcon: Icon(Icons.email),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'รหัสผ่าน',
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle login button press
//                 String email = emailController.text;
//                 String password = passwordController.text;

//                 // Call your login function with email and password
//                 // login(email, password);
//               },
//               child: Text('เข้าสู่ระบบ'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle login with Google button press
//                 signInWithGoogle().then((userCredential) {
//                   // Handle successful Google login
//                   // You can get the user information from userCredential.user
//                 }).catchError((error) {
//                   // Handle error during Google login
//                 });
//               },
//               child: Text('เข้าสู่ระบบด้วย Google'),
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => RegisterPage()),
//                     );
//                   },
//                   child: Text('ลงทะเบียน'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
//                     );
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
