
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
 bool obscurePassword = true;
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
                  image: AssetImage('assets/bglog.jpg'), // Replace with your background image path
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
  obscureText: obscurePassword,
  decoration: InputDecoration(
    labelText: 'รหัสผ่าน',
    prefixIcon: Icon(Icons.lock),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 113, 222, 247),
      ), // สีขอบเมื่อรับโฟกัส
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 150, 144, 144),
      ),
    ),
    suffixIcon: IconButton(
      onPressed: () {
        setState(() {
          obscurePassword = !obscurePassword; // สลับค่าระหัสผ่านเพื่อแสดงหรือซ่อน
        });
      },
      icon: Icon(
        obscurePassword ? Icons.visibility : Icons.visibility_off,
      ),
    ),
  ),
),

                   SizedBox(height: 16.0),
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
                            content: Text("กดปุ่ม 'ตกลง' เพื่อข้าสู่ระบบ"),
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
//////////////////////////////////////////////////////

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tes/admin/DashboardPage.dart';
// import 'package:tes/login/forgotpassword.dart';
// import 'package:tes/login/register.dart';
// import 'package:tes/user/homescreen.dart';


// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool obscurePassword = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 113, 222, 247),
//         title: const Text('เข้าสู่ระบบ'),
//       ),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             // Background image
//             Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/bglog.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // Semi-transparent overlay
//             Container(
//               color: const Color.fromARGB(255, 177, 200, 201)
//                   .withOpacity(0.4),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Add your circular logo image here
//                   Center(
//                     child: ClipOval(
//                       child: Image.asset(
//                         'assets/img.jpg',
//                         width: 150,
//                         height: 150,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16.0),
//                   TextFormField(
//                     controller: emailController,
//                     decoration: const InputDecoration(
//                       labelText: 'อีเมล',
//                       prefixIcon: Icon(Icons.email),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Color.fromARGB(255, 113, 222, 247),
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Color.fromARGB(255, 150, 144, 144)),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16.0),
//                   TextFormField(
//                     controller: passwordController,
//                     obscureText: obscurePassword,
//                     decoration: InputDecoration(
//                       labelText: 'รหัสผ่าน',
//                       prefixIcon: Icon(Icons.lock),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Color.fromARGB(255, 113, 222, 247),
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Color.fromARGB(255, 150, 144, 144),
//                         ),
//                       ),
//                       suffixIcon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             obscurePassword = !obscurePassword;
//                           });
//                         },
//                         icon: Icon(
//                           obscurePassword ? Icons.visibility : Icons.visibility_off,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16.0),
//                   SizedBox(
//                     width: 200,
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                             const Color.fromARGB(255, 113, 222, 247)),
//                       ),
//                       onPressed: () {
//                         FirebaseAuth.instance
//                             .signInWithEmailAndPassword(
//                           email: emailController.text,
//                           password: passwordController.text,
//                         )
//                             .then((value) {
//                           FirebaseAuth.instance.authStateChanges().listen((User? user) {
//                             if (user != null) {
//                              FirebaseFirestore.instance
//     .collection('users')
//     .doc(user.uid)
//     .get()
//     .then((DocumentSnapshot documentSnapshot) {
//   if (documentSnapshot.exists) {
//     String userType = documentSnapshot.get('type');
//     if (userType == "Admin") {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => AdminPage(),
//         ),
//       );
//     // } else if (userType == "Repairman") {
//     //   Navigator.pushReplacement(
//     //     context,
//     //     MaterialPageRoute(
//     //       builder: (context) => RepairmanPage(),
//     //     ),
//     //   );
//     } else if (userType == "member"){
//       // เพิ่มประเภทผู้ใช้สมาชิกที่คุณต้องการในนี้
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HomeScreen(),
//         ),
//       );
//     }
//   } else {
//     print("Document doesn't exist on the DB");
//   }
// });

//                             }
//                           });
//                         }).catchError((error) {
//                           var errorTxt = "";
//                           switch (error.hashCode) {
//                             case 461740379:
//                               {
//                                 errorTxt = "อีเมลซ้ำ กรุณาตรวจสอบ";
//                               }
//                               break;
//                             case 240054626:
//                               {
//                                 errorTxt = "รูปแบบอีเมลไม่ถูกต้อง";
//                               }
//                               break;
//                             default:
//                               {
//                                 errorTxt = error.toString();
//                               }
//                               break;
//                           }

//                           SnackBar snackBar = SnackBar(
//                               content: Text("เกิดข้อผิดพลาด : " + errorTxt));
//                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                         });
//                       },
//                       child: const Text('เข้าสู่ระบบ', style: TextStyle(color: Colors.white)),
//                     ),
//                   ),
//                   const SizedBox(height: 16.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => register()),
//                           );
//                         },
//                         child: const Text(
//                           'ลงทะเบียน',
//                           style: TextStyle(
//                             color: Color.fromARGB(255, 113, 222, 247),
//                           ),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ForgotPasswordPage()),
//                           );
//                         },
//                         child: const Text(
//                           'ลืมรหัสผ่าน',
//                           style: TextStyle(
//                             color: Color.fromARGB(255, 113, 222, 247),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
