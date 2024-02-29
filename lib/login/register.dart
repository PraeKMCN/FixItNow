

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tes/login/login.dart';
// import 'package:flutter/services.dart';

// class register extends StatefulWidget {
//   register({Key? key}) : super(key: key);

//   @override
//   _registerState createState() => _registerState();
// }

// class _registerState extends State<register> {
//   var email = TextEditingController();
//   var password = TextEditingController();
//   var name = TextEditingController();
//   var phonenumber = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   bool obscurePassword = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 113, 222, 247),
//         title: Text('ลงทะเบียน'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'กรุณากรอกชื่อและนามสกุล';
//                   }
//                   return null;
//                 },
//                 controller: name,
//                 decoration: InputDecoration(
//                   labelText: 'ชื่อและนามสกุล',
//                   prefixIcon: Icon(Icons.person),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'กรุณากรอก Email';
//                   }
//                   return null;
//                 },
//                 controller: email,
//                 decoration: InputDecoration(
//                   labelText: 'อีเมล',
//                   prefixIcon: Icon(Icons.email),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'กรุณากรอกรหัสผ่าน';
//                   }
//                   return null;
//                 },
//                 controller: password,
//                 obscureText: obscurePassword,
//                 decoration: InputDecoration(
//                   labelText: 'รหัสผ่าน',
//                   prefixIcon: Icon(Icons.lock),
//                   suffixIcon: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         obscurePassword = !obscurePassword;
//                       });
//                     },
//                     child: Icon(
//                       obscurePassword ? Icons.visibility : Icons.visibility_off,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'กรุณากรอกเบอร์โทรศัพท์';
//                   } else if (value.length != 10) {
//                     return 'เบอร์โทรศัพท์ควรมี 10 ตัว';
//                   }
//                   return null;
//                 },
//                 controller: phonenumber,
//                 keyboardType: TextInputType.phone,
//                 inputFormatters: [PhoneInputFormatter()],
//                 decoration: InputDecoration(
//                   labelText: 'เบอร์โทรศัพท์ (10 หลัก)',
//                   prefixIcon: Icon(Icons.phone),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(
//                       const Color.fromARGB(255, 113, 222, 247)),
//                 ),
//                 onPressed: () async {
//                   if (formKey.currentState!.validate()) {
//                     try {
//                       UserCredential userCredential = await FirebaseAuth
//                           .instance
//                           .createUserWithEmailAndPassword(
//                         email: email.text,
//                         password: password.text,
//                       );

//                       if (userCredential.user != null) {
//                         await storeUserDataInFirestore(
//                             userCredential.user!.uid);
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: Text('การสมัครสำเร็จ'),
//                               content:
//                                   Text('กดปุ่ม "ตกลง" เพื่อไปหน้าเข้าสู่ระบบ'),
//                               actions: [
//                                 TextButton(
//                                   child: Text('ตกลง'),
//                                   onPressed: () {
//                                     Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => LoginPage()),
//                                     );
//                                   },
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       }
//                     } catch (error) {
//                       print(error.toString());
//                       String errorMessage =
//                           'อีเมลนี้ถูกใช้งานไปแล้ว โปรดกรอกอีกเมลใหม่: $error';
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                         content: Text(errorMessage),
//                       ));
//                     }
//                   }
//                 },
//                 child: Text('ลงทะเบียน'),
//               ),
//               SizedBox(height: 16.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> storeUserDataInFirestore(String userId) async {
//     try {
//       CollectionReference profile =
//           FirebaseFirestore.instance.collection('profile');
//       await profile.doc(userId).set({
//         'name': name.text,
//         'email': email.text,
//         'password': password.text,
//         'phonenumber': phonenumber.text,
//       });
//     } catch (e) {
//       print(e.toString());
//       String errorMessage = 'เกิดข้อผิดพลาดในการบันทึกข้อมูล: $e';
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(errorMessage),
//       ));
//     }
//   }
// }

// class PhoneInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     final newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
//     if (newText.length <= 10) {
//       return TextEditingValue(
//         text: newText,
//         selection: TextSelection.fromPosition(
//           TextPosition(offset: newText.length),
//         ),
//       );
//     } else {
//       return TextEditingValue(
//         text: newText.substring(0, 10),
//         selection: TextSelection.fromPosition(
//           TextPosition(offset: 10),
//         ),
//       );
//     }
//   }
// }


/////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tes/login/login.dart';
import 'package:flutter/services.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  var phonenumber = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3EBACE),
        title: const Text('ลงทะเบียน'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Icon(
                    Icons.person,
                    size: 100,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกชื่อและนามสกุล';
                      }
                      return null;
                    },
                    controller: name,
                    decoration: const InputDecoration(
                      labelText: 'ชื่อและนามสกุล',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอก Email';
                      }
                      return null;
                    },
                    controller: email,
                    decoration: const InputDecoration(
                      labelText: 'อีเมล',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกรหัสผ่าน';
                      }
                      return null;
                    },
                    controller: password,
                    obscureText: obscurePassword,
                    decoration: const InputDecoration(
                      labelText: 'รหัสผ่าน',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกเบอร์โทรศัพท์';
                      } else if (value.length != 10) {
                        return 'เบอร์โทรศัพท์ควรมี 10 ตัว';
                      }
                      return null;
                    },
                    controller: phonenumber,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [PhoneInputFormatter()],
                    decoration: const InputDecoration(
                      labelText: 'เบอร์โทรศัพท์ (10 หลัก)',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                email: email.text,
                                password: password.text,
                              );

                          if (userCredential.user != null) {
                            await storeUserDataInFirestore(
                                userCredential.user!.uid);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('การสมัครสำเร็จ'),
                                  content: const Text(
                                      'กดปุ่ม "ตกลง" เพื่อไปหน้าเข้าสู่ระบบ'),
                                  actions: [
                                    TextButton(
                                      child: const Text('ตกลง'),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => LoginPage()),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        } catch (error) {
                          print(error.toString());
                          String errorMessage =
                              'อีเมลนี้ถูกใช้งานไปแล้ว โปรดกรอกอีกเมลใหม่: $error';
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(errorMessage),
                          ));
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 70, 196, 224)),
                    ),
                    child: const Text('ลงทะเบียน'),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> storeUserDataInFirestore(String userId) async {
    try {
      CollectionReference profile = FirebaseFirestore.instance.collection('profile');
      await profile.doc(userId).set({
        'name': name.text,
        'email': email.text,
        'password': password.text,
        'phonenumber': phonenumber.text,
        'type': 'member', // เปลี่ยนเป็นค่าที่คุณต้องการ, เช่น 'regular' หรือ 'premium'
      });
    } catch (e) {
      print(e.toString());
      String errorMessage = 'เกิดข้อผิดพลาดในการบันทึกข้อมูล: $e';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
      ));
    }
  }

  Future<void> checkIfUserIsMember(String userId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('profile')
          .doc(userId)
          .get();

      if (documentSnapshot.exists) {
        // User is a member, you can access their data including "type"
        print('User is a member!');
        print('User data: ${documentSnapshot.data()}');
        var userType = documentSnapshot['type'];
        print('User type: $userType');

        // ตรวจสอบประเภทของสมาชิก
        if (userType == 'regular') {
          print('Regular user actions...');
        } else if (userType == 'premium') {
          print('Premium user actions...');
        } else {
          print('Other user type actions...');
        }
      } else {
        print('User is not a member.');
      }
    } catch (e) {
      print('Error checking user membership: $e');
    }
  }
}

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    if (newText.length <= 10) {
      return TextEditingValue(
        text: newText,
        selection: TextSelection.fromPosition(
          TextPosition(offset: newText.length),
        ),
      );
    } else {
      return TextEditingValue(
        text: newText.substring(0, 10),
        selection: TextSelection.fromPosition(
          TextPosition(offset: 10),
        ),
      );
    }
  }
}
