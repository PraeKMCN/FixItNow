// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:tes/login/login.dart';

// ignore: must_be_immutable
// class register extends StatelessWidget {
//    register({super.key});
//  var email = TextEditingController();
//     var password = TextEditingController();
//     var passwords = TextEditingController();
//     var verify = TextEditingController();
//     var name = TextEditingController();
//     final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ลงทะเบียน'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//                TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty){
//                     return 'กรุณากรอกชื่อและนามสกุล';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'ชื่อ',
//                   prefixIcon: Icon(Icons.person),
//                 ),
//               ),
//               SizedBox(height: 16.0),
              
//               TextFormField(
//                 controller: email,
//         validator: (value) {
//                   if (value!.isEmpty){
//                     return 'กรุณากรอก Email';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'อีเมล',
//                   prefixIcon: Icon(Icons.email),
//                 ),
//               ),
        
//               SizedBox(height: 16.0),
//                TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty){
//                     return 'กรุณากรอกรหัสผ่าน';
//                   }
//                   return null;
//                 },
//                 controller: password,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'รหัสผ่าน',
//                   prefixIcon: Icon(Icons.lock),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//                TextFormField(
//                  controller: passwords,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'ยืนยันรหัสผ่าน',
//                   prefixIcon: Icon(Icons.lock),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//               if (formKey.currentState!.validate()) {
//                 FirebaseAuth.instance
//                     .createUserWithEmailAndPassword(
//                   email: email.text,
//                   password: password.text,
//                 )
//                     .then((value) {
//                   //--------- การสมัครสำเร็จ --------------
//                   value.user!.updateDisplayName(name.text);   //-------เพิ่มชื่อผู้ใช้งานระบบ 
        
//                   Widget okButton = TextButton(
//                     child: Text("ตกลง"),
//                     onPressed: () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => LoginPage()));
//                     },
//                   );
        
//                   // set up the AlertDialog
//                   AlertDialog alert = AlertDialog(
//                     title: Text("การสมัครสำเร็จ"),
//                     content: Text("กดปุ่ม 'ตกลง' เพื่อไปหน้าเข้าสู่ระบบ"),
//                     actions: [
//                       okButton,
//                     ],
//                   );
        
//                   // show the dialog
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return alert;
//                     },
//                   );
//                 }).catchError((error) {
//                   //---------- เกิดข้อผิดพลาดในการสมัคร -----------------
//                   print(error.hashCode);
//                   var errorTxt = "";
//                   switch (error.hashCode) {
//                     case 461740379:
//                       {
//                         errorTxt = "อีเมลซ้ำ กรุณาตรวจสอบ";
//                       }
//                       break;
//                     case 240054626:
//                       {
//                         errorTxt = "รูปแบบอีเมลไม่ถูกต้อง";
//                       }
//                       break;
//                     default:
//                       {
//                         errorTxt = error.toString();
//                       }
//                       break;
//                   }
        
//                   SnackBar snackBar =
//                       SnackBar(content: Text("เกิดข้อผิดพลาด : " + errorTxt));
//                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                 });
//               }
//             },
//                 child: Text('ลงทะเบียน'),
//               ),
//               SizedBox(height: 16.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('มีบัญชีอยู่แล้ว?'),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text('เข้าสู่ระบบ'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart'; // เพิ่มนี้

// // ignore: must_be_immutable, camel_case_types
// class register extends StatefulWidget {

//   register({super.key});

//   @override
//   State<register> createState() => _registerState();
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
 

//        TextFormField(
//   validator: (value) {
//     if (value!.isEmpty) {
//       return 'กรุณากรอกรหัสผ่าน';
//     }
//     return null;
//   },
//   controller: password,
//   obscureText: obscurePassword, // ใช้ค่าสถานะที่เราสร้างไว้
//   decoration: InputDecoration(
//     labelText: 'รหัสผ่าน',
//     prefixIcon: Icon(Icons.lock),
//     suffixIcon: GestureDetector(
//       onTap: () {
//         setState(() {
//           obscurePassword = !obscurePassword; // เปลี่ยนค่าเมื่อคลิก
//         });
//       },
//       child: Icon(
//         obscurePassword ? Icons.visibility : Icons.visibility_off,
//       ),
//     ),
//   ),
// ),

// TextFormField(
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'กรุณากรอกเบอร์โทรศัพท์';
//                   }
//                   return null;
//                 },
//                 controller: phonenumber,
//                 decoration: InputDecoration(
//                   labelText: 'เบอร์โทรศัพท์',
//                   prefixIcon: Icon(Icons.phone),
//                 ),
//               ),

              
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (formKey.currentState!.validate()) {
//                     try {
//                       UserCredential userCredential = await FirebaseAuth.instance
//                           .createUserWithEmailAndPassword(
//                             email: email.text,
//                             password: password.text,
//                           );

//                       if (userCredential.user != null) {
//                         // การสมัครสำเร็จ
//                         await storeUserDataInFirestore(userCredential.user!.uid);
//                         // เปลี่ยนหน้าหลังจากการลงทะเบียน
//                         Navigator.pushReplacementNamed(context, '/LoginPage');
//                       }
//                     } catch (error) {
//                       // จัดการข้อผิดพลาดที่เกิดขึ้นในการสมัคร
//                       print(error.toString());
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

//   Future<void> storeUserDataInFirestore(String proid) async {
//     try {
//       CollectionReference profile = FirebaseFirestore.instance.collection('profile');
//       await profile.doc(proid).set({
//         'name': name.text,
//         'email' : email.text,
//         'password': password.text,
//         'phonenumber' : phonenumber.text,
        
//       });
//     } catch (e) {
//       // จัดการข้อผิดพลาดที่เกิดขึ้นใน Firestore
//       print(e.toString());
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tes/login/login.dart';

class register extends StatefulWidget {
  register({Key? key}) : super(key: key);

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
      appBar: AppBar(backgroundColor:  Color.fromARGB(255, 113, 222, 247),
        title: Text('ลงทะเบียน'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'กรุณากรอกชื่อและนามสกุล';
                  }
                  return null;
                },
                controller: name,
                decoration: InputDecoration(
                  labelText: 'ชื่อและนามสกุล',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'กรุณากรอก Email';
                  }
                  return null;
                },
                controller: email,
                decoration: InputDecoration(
                  labelText: 'อีเมล',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'กรุณากรอกรหัสผ่าน';
                  }
                  return null;
                },
                controller: password,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: 'รหัสผ่าน',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    child: Icon(
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'กรุณากรอกเบอร์โทรศัพท์';
                  }
                  return null;
                },
                controller: phonenumber,
                decoration: InputDecoration(
                  labelText: 'เบอร์โทรศัพท์',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(height: 16.0),
      ElevatedButton(
          style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 113, 222,
                                247)), // Use the same color as the AppBar
                      ),
  onPressed: () async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );

        if (userCredential.user != null) {
          // การสมัครสำเร็จ
          await storeUserDataInFirestore(userCredential.user!.uid);
          // แสดง AlertDialog แจ้งเตือนสมัครสำเร็จ
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('การสมัครสำเร็จ'),
                content: Text('กดปุ่ม "ตกลง" เพื่อไปหน้าเข้าสู่ระบบ'),
                actions: [
                  TextButton(
                    child: Text('ตกลง'),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ],
              );
            },
          );
        }
      } catch (error) {
        // จัดการข้อผิดพลาดที่เกิดขึ้นในการสมัคร
        print(error.toString());
        String errorMessage = 'อีเมลนี้ถูกใช้งานไปแล้ว โปรดกรอกอีกเมลใหม่: $error';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
        ));
      }
    }
  },
  child: Text('ลงทะเบียน'),
),

              SizedBox(height: 16.0),
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
      });
    } catch (e) {
      // จัดการข้อผิดพลาดที่เกิดขึ้นใน Firestore
      print(e.toString());
      String errorMessage = 'เกิดข้อผิดพลาดในการบันทึกข้อมูล: $e';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
      ));
    }
  }
}
