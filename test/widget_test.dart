 
//  Widget registButton() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
//       child: SizedBox(
//         height: width * 0.1,
//         width: width * 0.7,
//         child: FilledButton.tonal(
//           onPressed: () 
//           {
//             if (formKey.currentState!.validate()) {
//               FirebaseAuth.instance
//                   .createUserWithEmailAndPassword(
//                 email: email.text,
//                 password: password.text,
//               )
//                   .then((value) {
//                 //--------- การสมัครสำเร็จ --------------
//                 value.user!.updateDisplayName(name.text);   //-------เพิ่มชื่อผู้ใช้งานระบบ 

//                 Widget okButton = TextButton(
//                   child: Text("ตกลง"),
//                   onPressed: () {
//                     Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: (context) => LoginPage2()));
//                   },
//                 );

//                 // set up the AlertDialog
//                 AlertDialog alert = AlertDialog(
//                   title: Text("การสมัครสำเร็จ"),
//                   content: Text("กดปุ่ม 'ตกลง' เพื่อไปหน้าเข้าสู่ระบบ"),
//                   actions: [
//                     okButton,
//                   ],
//                 );

//                 // show the dialog
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return alert;
//                   },
//                 );
//               }).catchError((error) {
//                 //---------- เกิดข้อผิดพลาดในการสมัคร -----------------
//                 print(error.hashCode);
//                 var errorTxt = "";
//                 switch (error.hashCode) {
//                   case 461740379:
//                     {
//                       errorTxt = "อีเมลซ้ำ กรุณาตรวจสอบ";
//                     }
//                     break;
//                   case 240054626:
//                     {
//                       errorTxt = "รูปแบบอีเมลไม่ถูกต้อง";
//                     }
//                     break;
//                   default:
//                     {
//                       errorTxt = error.toString();
//                     }
//                     break;
//                 }

//                 SnackBar snackBar =
//                     SnackBar(content: Text("เกิดข้อผิดพลาด : " + errorTxt));
//                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
//               });
//             }
//           },
//           child: Text(
//             'ลงทะเบียน',
//             style: TextStyle(
//               fontSize: width * 0.04,
//             ),
//           ),
//           // style: FilledButton.styleFrom(fixedSize: ),
//         ),
//       ),
//     );
//   }