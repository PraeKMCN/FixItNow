// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tes/user/historydetail.dart';

// class Historyadmin extends StatefulWidget {
//   const Historyadmin({Key? key}) : super(key: key);

//   @override
//   State<Historyadmin> createState() => _HistoryadminState();
// }

// class _HistoryadminState extends State<Historyadmin> {
//   final auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("ประวัติการแจ้งซ่อม"),
//         backgroundColor: Color.fromARGB(255, 142, 212, 253),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(30),
//         child: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection("users")
//               .where("user", isEqualTo: auth.currentUser!.email)
//               .orderBy("dateTime", descending: true) // เรียงลำดับตามเวลาการเพิ่มข้อมูล
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             }
//            if (snapshot.hasError) {
//   return Text("เกิดข้อผิดพลาด: ${snapshot.error.runtimeType}");
// }if (snapshot.hasError) {
//   if (snapshot.error is FirebaseException) {
//     FirebaseException firebaseError = snapshot.error as FirebaseException;
//     return Text("เกิดข้อผิดพลาด: ${firebaseError.code} - ${firebaseError.message}");
//   } else {
//     return Text("เกิดข้อผิดพลาด: ${snapshot.error.toString()}");
//   }
// }



//             List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
//             return ListView(
//               children: documents.map((doc) {
//                 Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//                 return Card(
//                   child: ListTile(
//                     title: Text("รายการแจ้งซ่อม"),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("หมวด: ${data["service"]}"),
//                         Text("ปัญหา: ${data["problem"]}"),
//                         Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
//                       ],
//                     ),
//                     onTap: () {
//                       // Navigator.of(context).push(
//                       //   MaterialPageRoute(
//                       //     builder: (context) => historydetail.historydetail(data: data),
//                       //   ),
//                       // );
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

