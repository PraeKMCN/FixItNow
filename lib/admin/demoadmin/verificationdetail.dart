// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class verificationdetail extends StatefulWidget {
// //   final Map<String, dynamic> data;

// //   verificationdetail({required this.data});

// //   @override
// //   State<verificationdetail> createState() => _verificationdetailState();
// // }

// // class _verificationdetailState extends State<verificationdetail> {
// //   Map<String, dynamic> firestoreData = {};

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchDataFromFirestore();
// //   }

// //   void fetchDataFromFirestore() async {
// //     String documentId = widget.data["documentId"]; // เราต้องมี document ID จาก Firestore

// //     DocumentSnapshot document = await FirebaseFirestore.instance
// //         .collection("users")
// //         .doc(documentId)
// //         .get();

// //     setState(() {
// //       firestoreData = document.data() as Map<String, dynamic>;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("รายละเอียดการแจ้งซ่อม")),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(30),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text("หมวด: ${widget.data["service"]}"),
// //               Text("อาคาร: ${widget.data["Building"]}"),
// //               Text("ชั้น: ${widget.data["floor"]}"),
// //               Text("ห้อง: ${widget.data["room"]}"),
// //               Text("ปัญหา: ${widget.data["problem"]}"),
// //               if (widget.data["url"] != null)
// //                 Image.network(widget.data["url"]), // แสดงรูปภาพถ้ามี URL
// //               Text("ว/ด/ป,เวลา: ${widget.data["dateTime"]}"),
              
// //               // เพิ่มรายละเอียดอื่น ๆ ตามความต้องการ
// //               Text("รายละเอียดจาก Firestore: ${firestoreData["additionalInfo"] ?? 'ไม่มีข้อมูล'}"),

// //              SizedBox(height: 20),
// //             Center(
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   // ตรวจสอบหรือดำเนินการตามความต้องการ
                  
// //                 },
// //                 child: Text("ดำเนินการ"),
// //               ),
// //             ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// // //////////////////////
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tes/appdata.dart';

// class VerificationDetail extends StatefulWidget {
//   final Map<String, dynamic> data;

//   VerificationDetail({required this.data});

//   @override
//   State<VerificationDetail> createState() => _VerificationDetailState();
// }

// class _VerificationDetailState extends State<VerificationDetail> {
//   Map<String, dynamic> firestoreData = {};

//   @override
//   void initState() {
//     super.initState();
//     fetchDataFromFirestore();
//   }

//   void fetchDataFromFirestore() async {
//     // String documentId = widget.data["docid"];
//     // print(documentId);
//     // print("-----------------------------------------------------------------");
    

//     DocumentSnapshot document = await FirebaseFirestore.instance
//         .collection("users")
//         .doc(docid)
//         .get();

//     setState(() {
//       firestoreData = document.data() as Map<String, dynamic>;
//     });
//   }

// void saveDataToFirestore() async {
//   print("---------------------------------------------------");
  
//    Map<String, dynamic> data = {};


              
//               data["status"] = "กำลังดำเนินการ";

//   // String documentId = widget.data["documentId"];
//   print("000000000000000000000000000000000000000"+docid);

//   // Print statements for debugging
//   // print("Before updating status. Document ID: $documentId");

//   // Check if firestoreData["status"] is not null before using it
 
// // print(docid);
//   try {
//      await FirebaseFirestore.instance
//                   .collection("users")
//                   .doc()
//                   .update(data);

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("อัปเดตข้อมูลสำเร็จ"),
//       ),
//     );
//   } catch (e) {
//     print("Error updating status: $e");
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("Error updating status: $e"),
//       ),
//     );
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("รายละเอียดการแจ้งซ่อม")),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("หมวด: ${widget.data["service"]}"),
//               Text("อาคาร: ${widget.data["Building"]}"),
//               Text("ชั้น: ${widget.data["floor"]}"),
//               Text("ห้อง: ${widget.data["room"]}"),
//               Text("ปัญหา: ${widget.data["problem"]}"),
//               Text("status:${widget.data["status"]}"),
//               if (widget.data["url"] != null)
//                 Image.network(widget.data["url"]),

//               Text("ว/ด/ป,เวลา: ${widget.data["dateTime"]}"),

//               Text(
//                   "รายละเอียดจาก Firestore: ${firestoreData["additionalInfo"] ?? 'ไม่มีข้อมูล'}"),

//               SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // เรียกใช้ฟังก์ชันเพื่อบันทึกข้อมูล
//                     saveDataToFirestore();
//                   },
//                   child: Text("ดำเนินการ"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// /////////////////////////

