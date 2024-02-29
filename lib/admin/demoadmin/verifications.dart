// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class Waiting extends StatefulWidget {
// //   @override
// //   State<Waiting> createState() => _WaitingState();
// // }

// // class _WaitingState extends State<Waiting> {
// //   // นำเข้าฟังก์ชัน navigateToRelatedPage เพื่อให้ถูกต้อง
// //   void navigateToRelatedPage(BuildContext context, String statusFirestoreField) {
// //     // implement โค้ดในการนำทางไปยังหน้าที่เกี่ยวข้อง
// //     // ...
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('สถานะคำร้องที่รอตรวจสอบ'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               '',
// //               style: TextStyle(
// //                 fontSize: 24,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             SizedBox(height: 16),
// //             // แสดงรายการที่กำลังดำเนินการ
// //             InProgressList(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class InProgressList extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder<QuerySnapshot>(
// //       stream: FirebaseFirestore.instance.collection('users').where('status', isEqualTo: 'in_progress').snapshots(),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return CircularProgressIndicator();
// //         }

// //         if (snapshot.hasError) {
// //           return Text('Error: ${snapshot.error}');
// //         }

// //         // ดึงข้อมูลจาก snapshot
// //         var tasks = snapshot.data!.docs;

// //         return ListView.builder(
// //           itemCount: tasks.length,
// //           itemBuilder: (context, index) {
// //             var task = tasks[index];
// //             return Card(
// //               elevation: 3,
// //               margin: EdgeInsets.symmetric(vertical: 8),
// //               child: ListTile(
// //                 title: Text(task['title']),
// //                 subtitle: Text(task['description']),
// //                 onTap: () {
// //                   // ทำบางอย่างเมื่อคลิกที่รายการ
// //                   navigateToRelatedPage(context, task['status']);
// //                 },
// //               ),
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }
  
// //   void navigateToRelatedPage(BuildContext context, task) {}
// // }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tes/admin/hisade.dart';
// import 'package:tes/admin/status/waitingdetail.dart';

// import 'package:tes/admin/status/verificationdetail.dart';
// import 'package:tes/appdata.dart';

// class verification extends StatefulWidget {
//   const verification({Key? key, required Map data}) : super(key: key);

//   @override
//   State<verification> createState() => _verificationState();
// }

// class _verificationState extends State<verification> {
//   final auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("คำร้องที่รอดำเนินการ"),
//         backgroundColor: Color.fromARGB(255, 142, 212, 253),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(30),
//         child: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection("users").snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               // แสดงสถานะ "รอดำเนินการ" ขณะโหลดข้อมูล
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircularProgressIndicator(),
//                     SizedBox(height: 10),
//                     Text("กำลังดำเนินการ..."),
//                   ],
//                 ),
//               );
//             }
//             if (snapshot.hasError) {
//               if (snapshot.error is FirebaseException) {
//                 FirebaseException firebaseError = snapshot.error as FirebaseException;
//                 return Text("Firestore Error: ${firebaseError.code} - ${firebaseError.message}");
//               } else {
//                 return Text("Error: ${snapshot.error.toString()}");
//               }
//             }

//             List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
//             return ListView(
//               children: documents.map((doc) {
//                 Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//                 return Card(
//                   child: ListTile(
//                     title: Text("user: ${data["email"]}"),
                    


//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("หมวด: ${data["service"]}"),
//                         Text("ปัญหา: ${data["problem"]}"),
//                         Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
//                         Text("status: ${data["status"]}"),
//                         // เพิ่มข้อมูลเพิ่มเติมตามต้องการ
//                       ],
//                     ),
//                     onTap: () {
//                       // ทำอะไรก็ตามเมื่อคลิกที่รายการ
//                       // print("test: ----------------------"+  doc.id.toString());

//                       // docid=doc.id.toString();
//                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerificationDetail(data: data)));
//                     },
//                   ),
//                 );
//               }).toList(),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }