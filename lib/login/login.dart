// // import 'package:flutter/material.dart';
// // import 'register.dart';
// // import 'forgotpassword.dart';
// // class LoginPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('เข้าสู่ระบบ'),
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.all(16.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             TextField(
// //               decoration: InputDecoration(
// //                 labelText: 'อีเมล',
// //                 prefixIcon: Icon(Icons.email),
// //               ),
// //             ),
// //             SizedBox(height: 16.0),
// //             TextField(
// //               obscureText: true,
// //               decoration: InputDecoration(
// //                 labelText: 'รหัสผ่าน',
// //                 prefixIcon: Icon(Icons.lock),
// //               ),
// //             ),
// //             SizedBox(height: 16.0),
// //             ElevatedButton(
// //               onPressed: () {},
// //               child: Text('เข้าสู่ระบบ'),
// //             ),
// //             SizedBox(height: 16.0),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 TextButton(
// //                   onPressed: () {
// //                     Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => RegisterPage()),);
// //                   },
// //                   child: Text('ลงทะเบียน'),
// //                 ),
// //                 TextButton(
// //                   onPressed: () {
// //                     Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
// //                   },
// //                   child: Text('ลืมรหัสผ่าน'),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:tes/login/forgotpassword.dart';
// import 'package:tes/login/register.dart';
// import 'package:tes/user/homepage.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();

//   final TextEditingController passwordController = TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     Firebase.initializeApp();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 113, 222, 247),
//         title: Text(
//           'เข้าสู่ระบบ',
//         ),
//       ),
//       body:
//       Padding(
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
//             SizedBox(
//               width: 200,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//       backgroundColor: MaterialStateProperty.all<Color>(
//         Color.fromARGB(255, 113, 222, 247), // Change this color as needed
//       )),
//                 onPressed: () {
//                   FirebaseAuth.instance
//                       .signInWithEmailAndPassword(
//                     email: emailController.text,
//                     password: passwordController.text,
//                   )
//                       .then((value) {
//                     //--------- การสมัครสำเร็จ --------------
//                     Widget okButton = TextButton(
//                       child: Text("ตกลง"),
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => HomePage()));
//                       },
//                     );

//                     // set up the AlertDialog
//                     AlertDialog alert = AlertDialog(
//                       title: Text("เข้าสู่ระบบสำเร็จ"),
//                       content: Text("กดปุ่ม 'ตกลง' เพื่อไปหน้าเข้าสู่ระบบ"),
//                       actions: [
//                         okButton,
//                       ],
//                     );

//                     // show the dialog
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return alert;
//                       },
//                     );
//                   }).catchError((error) {
//                     //---------- เกิดข้อผิดพลาดในการสมัคร -----------------
//                     print(error.hashCode);
//                     var errorTxt = "";
//                     switch (error.hashCode) {
//                       case 461740379:
//                         {
//                           errorTxt = "อีเมลซ้ำ กรุณาตรวจสอบ";
//                         }
//                         break;
//                       case 240054626:
//                         {
//                           errorTxt = "รูปแบบอีเมลไม่ถูกต้อง";
//                         }
//                         break;
//                       default:
//                         {
//                           errorTxt = error.toString();
//                         }
//                         break;
//                     }

//                     SnackBar snackBar =
//                         SnackBar(content: Text("เกิดข้อผิดพลาด : " + errorTxt));
//                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                   });
//                   // String email = emailController.text;
//                   // String password = passwordController.text;

//                   // Perform login logic here
//                 },
//                 child: Text(
//                   'เข้าสู่ระบบ',
//                 ),
//               ),
//             ), //-------เพิ่มชื่อผู้ใช้งานระบบ

//             SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => register()),
//                     );
//                   },
//                   child: Text('ลงทะเบียน'),
//                 ),
//
//                   }, onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => ForgotPasswordPage()),
//                     );
//                   },
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tes/login/forgotpassword.dart';
import 'package:tes/login/register.dart';
import 'package:tes/user/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 113, 222, 247),
        title: const Text('เข้าสู่ระบบ'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/bglog.jpg'), // Replace with your background image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Semi-transparent overlay
            Container(
              color: const Color.fromARGB(255, 177, 200, 201)
                  .withOpacity(0.4), // Adjust opacity as needed
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add your circular logo image here
                  Center(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/img.jpg', // Replace with your logo image path
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'อีเมล',
                      
                      prefixIcon: Icon(Icons.email),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 113, 222, 247),
                        ), // สีขอบเมื่อรับโฟกัส
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 150, 144, 144)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'รหัสผ่าน',
                      prefixIcon: Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 113, 222, 247),
                        ), // สีขอบเมื่อรับโฟกัส
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 150, 144, 144)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      // Use ElevatedButton to change button color
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 113, 222,
                                247)), // Use the same color as the AppBar
                      ),

                      onPressed: () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        )
                            .then((value) {
                          //--------- การสมัครสำเร็จ --------------
                          Widget okButton = TextButton(
                            child: Text("ตกลง"),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                          );

                          // set up the AlertDialog
                          AlertDialog alert = AlertDialog(
                            title: Text("เข้าสู่ระบบสำเร็จ"),
                            content:
                                Text("กดปุ่ม 'ตกลง' เพื่อข้าสู่ระบบ"),
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

                          SnackBar snackBar = SnackBar(
                              content: Text("เกิดข้อผิดพลาด : " + errorTxt));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      },
                      child: const Text('เข้าสู่ระบบ',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 16.0),
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
                        child: const Text(
                          'ลงทะเบียน',
                          style: TextStyle(
                            color: Color.fromARGB(255, 113, 222, 247),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()),
                          );
                        },
                        child: const Text(
                          'ลืมรหัสผ่าน',
                          style: TextStyle(
                            color: Color.fromARGB(255, 113, 222, 247),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
