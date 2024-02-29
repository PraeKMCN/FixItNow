
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:tes/admin/homeadmin.dart';
// import 'package:tes/login/forgotpassword.dart';
// import 'package:tes/login/register.dart';
// import 'package:tes/user/homepage.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//  bool obscurePassword = true;
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
//                   image: AssetImage('assets/bglog.jpg'), // Replace with your background image path
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // Semi-transparent overlay
//             Container(
//               color: const Color.fromARGB(255, 177, 200, 201)
//                   .withOpacity(0.4), // Adjust opacity as needed
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
//                         'assets/img.jpg', // Replace with your logo image path
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
//                         ), // สีขอบเมื่อรับโฟกัส
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Color.fromARGB(255, 150, 144, 144)),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16.0),

         
// TextFormField(
//   controller: passwordController,
//   obscureText: obscurePassword,
//   decoration: InputDecoration(
//     labelText: 'รหัสผ่าน',
//     prefixIcon: Icon(Icons.lock),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Color.fromARGB(255, 113, 222, 247),
//       ), // สีขอบเมื่อรับโฟกัส
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Color.fromARGB(255, 150, 144, 144),
//       ),
//     ),
//     suffixIcon: IconButton(
//       onPressed: () {
//         setState(() {
//           obscurePassword = !obscurePassword; // สลับค่าระหัสผ่านเพื่อแสดงหรือซ่อน
//         });
//       },
//       icon: Icon(
//         obscurePassword ? Icons.visibility : Icons.visibility_off,
//       ),
//     ),
//   ),
// ),

//                    SizedBox(height: 16.0),
//                   SizedBox(
//                     width: 200,
//                     child: ElevatedButton(
//                       // Use ElevatedButton to change button color
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                             const Color.fromARGB(255, 113, 222,
//                                 247)), // Use the same color as the AppBar
//                       ),

//                       onPressed: () {
//                         FirebaseAuth.instance
//                             .signInWithEmailAndPassword(
//                           email: emailController.text,
//                           password: passwordController.text,
//                         )
//                             .then((value) {
                              
//                           //--------- ล็อกอินสำเร็จ --------------

//                           Widget okButton = TextButton(
//                             child: Text("ตกลง"),
//                             onPressed: () {
//                               Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => HomePage()));
//                             },
//                           );

//                           // set up the AlertDialog
//                           AlertDialog alert = AlertDialog(
//                             title: Text("เข้าสู่ระบบสำเร็จ"),
//                             content: Text("กดปุ่ม 'ตกลง' เพื่อข้าสู่ระบบ"),
//                             actions: [
//                               okButton,
//                             ],
//                           );

//                           // show the dialog
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return alert;
//                             },
//                           );
//                         }).catchError((error) {
//                           //---------- เกิดข้อผิดพลาดในการสมัคร -----------------
//                           print(error.hashCode);
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
//                       child: const Text('เข้าสู่ระบบ',
//                           style: TextStyle(color: Colors.white)),
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

//////////////////////////////////////////////////
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tes/admin/homeadmin.dart';
// import 'package:tes/login/forgotpassword.dart';
// import 'package:tes/login/register.dart';
// import 'package:tes/repairman/home1.dart';
// import 'package:tes/user/homepage.dart';

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
//               color: const Color.fromARGB(255, 177, 200, 201).withOpacity(0.4),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
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
//                           color: Color.fromARGB(255, 150, 144, 144),
//                         ),
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
//                           const Color.fromARGB(255, 113, 222, 247),
//                         ),
//                       ),
//                       onPressed: () {
//                         FirebaseAuth.instance
//                             .signInWithEmailAndPassword(
//                               email: emailController.text,
//                               password: passwordController.text,
//                             )
//                             .then((value) {
//                               FirebaseAuth.instance.authStateChanges().listen((User? user) {
//                                 if (user != null) {
//                                   FirebaseFirestore.instance
//                                       .collection('profile')
//                                       .doc(user.uid)
//                                       .get()
//                                       .then((DocumentSnapshot documentSnapshot) {
//                                     if (documentSnapshot.exists) {
//                                       String userType = documentSnapshot.get('type');
//                                       if (userType == "Admin") {
//                                         Navigator.pushReplacement(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => HomePageAdmin(),
//                                           ),
//                                         );
//                                       } else if (userType == "member") {
//                                         Navigator.pushReplacement(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => HomePage(),
//                                           ),
//                                         );
//                                       } else {
//                                         // ประเภทผู้ใช้ที่คุณต้องการในนี้
//                                         Navigator.pushReplacement(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) => RepairmanPage(),
//                                           ),
//                                         );
//                                       }
//                                     } else {
//                                       print("Document doesn't exist on the DB");
//                                     }
//                                   });
//                                 }
//                               });
//                             })
//                             .catchError((error) {
//                               var errorTxt = "";
//                               switch (error.hashCode) {
//                                 case 461740379:
//                                   {
//                                     errorTxt = "อีเมลซ้ำ กรุณาตรวจสอบ";
//                                   }
//                                   break;
//                                 case 240054626:
//                                   {
//                                     errorTxt = "รูปแบบอีเมลไม่ถูกต้อง";
//                                   }
//                                   break;
//                                 default:
//                                   {
//                                     errorTxt = error.toString();
//                                   }
//                                   break;
//                               }

//                               SnackBar snackBar = SnackBar(
//                                 content: Text("เกิดข้อผิดพลาด : " + errorTxt),
//                               );
//                               ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                             });
//                       },
//                       child: const Text(
//                         'เข้าสู่ระบบ',
//                         style: TextStyle(color: Colors.white),
//                       ),
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
//                               builder: (context) => ForgotPasswordPage(),
//                             ),
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
/////////////////////////////////////////////

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tes/admin/homeadmin.dart';
import 'package:tes/login/forgotpassword.dart';
import 'package:tes/login/register.dart';
import 'package:tes/repairman/Historyre.dart';
import 'package:tes/repairman/home1.dart';
import 'package:tes/repairman/home2.dart';
import 'package:tes/user/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

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
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bglog.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: const Color(0xFF3EBACE).withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Circular logo image
                Center(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/img.jpg',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'อีเมล',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'รหัสผ่าน',
                    labelStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      icon: Icon(
                        obscurePassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        )
                        .then((value) {
                      FirebaseAuth.instance.authStateChanges().listen((User? user) {
                        if (user != null) {
                          FirebaseFirestore.instance
                              .collection('profile')
                              .doc(user.uid)
                              .get()
                              .then((DocumentSnapshot documentSnapshot) {
                            if (documentSnapshot.exists) {
                              String userType = documentSnapshot.get('type');
                              if (userType == "Admin") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePageAdmin(),
                                  ),
                                );
                              } else if (userType == "member") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => homepagerep(),
                                  ),
                                );
                              }
                            } else {
                              print("Document doesn't exist on the DB");
                            }
                          });
                        }
                      });
                    }).catchError((error) {
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
                        content: Text("เกิดข้อผิดพลาด : " + errorTxt),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 127, 203, 197),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5, // เพิ่มเงาให้กับปุ่ม
                  ),
                  child: Text(
                    'เข้าสู่ระบบ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0, // ปรับขนาดตัวอักษร
                    ),
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
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'ลืมรหัสผ่าน',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
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
    );
  }
}
