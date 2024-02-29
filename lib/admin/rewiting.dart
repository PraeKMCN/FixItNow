
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:tes/admin/hisade.dart';

// // class hisad extends StatefulWidget {
// //   const hisad({Key? key}) : super(key: key);

// //   @override
// //   State<hisad> createState() => _hisadState();
// // }

// // class _hisadState extends State<hisad> {
// //   final auth = FirebaseAuth.instance;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("ประวัติการแจ้งซ่อม"),
// //         backgroundColor: Color.fromARGB(255, 142, 212, 253),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.search),
// //             onPressed: () {
// //               // เมื่อกดปุ่มค้นหา
// //               _openSearchPage(context);
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(30),
// //         child: StreamBuilder<QuerySnapshot>(
// //           stream: FirebaseFirestore.instance
// //               .collection("users")
// //               .where("user", isEqualTo: auth.currentUser!.email)
// //               .orderBy("dateTime", descending: true)
// //               .snapshots(),
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return Center(child: CircularProgressIndicator());
// //             }
// //             if (snapshot.hasError) {
// //               if (snapshot.error is FirebaseException) {
// //                 FirebaseException firebaseError = snapshot.error as FirebaseException;
// //                 return Text("เกิดข้อผิดพลาด: ${firebaseError.code} - ${firebaseError.message}");
// //               } else {
// //                 return Text("เกิดข้อผิดพลาด: ${snapshot.error.toString()}");
// //               }
// //             }

// //             List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
// //             return ListView(
// //               children: documents.map((doc) {
// //                 Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
// //                 return Card(
// //                   child: ListTile(
// //                     title: Text("รายการแจ้งซ่อม"),
// //                     subtitle: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text("หมวด: ${data["service"]}"),
// //                         Text("ปัญหา: ${data["problem"]}"),
// //                         Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
// //                       ],
// //                     ),
// //                     onTap: () {
// //                       // เมื่อคลิกที่รายการ
// //                       Navigator.of(context).push(
// //                         MaterialPageRoute(
// //                           builder: (context) => HistoryDetail(data: data),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 );
// //               }).toList(),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }

// //   void _openSearchPage(BuildContext context) {
// //     // เปิดหน้าค้นหา
// //     showSearch(
// //       context: context,
// //       delegate: CustomSearchDelegate(historyData: _retrieveHistoryData()),
// //     );
// //   }

// //   List<Map<String, dynamic>> _retrieveHistoryData() {
// //     // ฟังก์ชันนี้ใช้เพื่อดึงข้อมูลประวัติการแจ้งซ่อม
// //     // จำลองข้อมูลหรือดึงจาก Firestore ตามต้องการ
// //     return [
// //       {"service": "บริการ 1", "problem": "ปัญหา 1", "dateTime": "2023-01-01 12:00:00"},
// //       {"service": "บริการ 2", "problem": "ปัญหา 2", "dateTime": "2023-01-02 14:30:00"},
// //       {"service": "บริการ 3", "problem": "ปัญหา 3", "dateTime": "2023-01-03 10:45:00"},
// //       // เพิ่มข้อมูลเพิ่มเติมตามต้องการ
// //     ];
// //   }
// // }

// // class CustomSearchDelegate extends SearchDelegate {
// //   final List<Map<String, dynamic>> historyData;
// //   final List<Map<String, dynamic>> filteredData;

// //   CustomSearchDelegate({required this.historyData})
// //       : filteredData = List.from(historyData);

// //   @override
// //   List<Widget> buildActions(BuildContext context) {
// //     return [
// //       IconButton(
// //         icon: Icon(Icons.clear),
// //         onPressed: () {
// //           query = '';
// //           showSuggestions(context);
// //         },
// //       ),
// //     ];
// //   }

// //   @override
// //   Widget buildLeading(BuildContext context) {
// //     return IconButton(
// //       icon: Icon(Icons.arrow_back),
// //       onPressed: () {
// //         close(context, '');
// //       },
// //     );
// //   }

// //   @override
// //   Widget buildResults(BuildContext context) {
// //     return buildSearchResults();
// //   }

// //   @override
// //   Widget buildSuggestions(BuildContext context) {
// //     return buildSearchResults();
// //   }

// //   Widget buildSearchResults() {
// //     filteredData.clear();
// //     filteredData.addAll(historyData.where((data) {
// //       String queryLower = query.toLowerCase();
// //       String serviceLower = data['service'].toLowerCase();
// //       String problemLower = data['problem'].toLowerCase();
// //       return serviceLower.contains(queryLower) || problemLower.contains(queryLower);
// //     }));

// //     return ListView.builder(
// //       itemCount: filteredData.length,
// //       itemBuilder: (context, index) {
// //         Map<String, dynamic> data = filteredData[index];
// //         return Card(
// //           child: ListTile(
// //             title: Text("รายการแจ้งซ่อม"),
// //             subtitle: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text("หมวด: ${data["service"]}"),
// //                 Text("ปัญหา: ${data["problem"]}"),
// //                 Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
// //               ],
// //             ),
// //             onTap: () {
// //               // เมื่อคลิกที่รายการในการค้นหา
// //               Navigator.of(context).push(
// //                 MaterialPageRoute(
// //                   builder: (context) => hisde(data: data),
// //                 ),
// //               );
// //             },
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // class HistoryDetail extends StatelessWidget {
// //   final Map<String, dynamic> data;

// //   const HistoryDetail({Key? key, required this.data}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("รายละเอียดการแจ้งซ่อม"),
// //         backgroundColor: Color.fromARGB(255, 142, 212, 253),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text("หมวด: ${data["service"]}"),
// //             Text("ปัญหา: ${data["problem"]}"),
// //             Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
// //             // เพิ่มข้อมูลเพิ่มเติมตามต้องการ
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:tes/admin/hisade.dart';

// // class hisad extends StatefulWidget {
// //   const hisad({Key? key}) : super(key: key);

// //   @override
// //   State<hisad> createState() => _hisadState();
// // }

// // class _hisadState extends State<hisad> {
// //   final auth = FirebaseAuth.instance;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("ข้อมูลทั้งหมดใน Collection Users"),
// //         backgroundColor: Color.fromARGB(255, 142, 212, 253),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(30),
// //         child: StreamBuilder<QuerySnapshot>(
// //           stream: FirebaseFirestore.instance.collection("users").snapshots(),
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return Center(child: CircularProgressIndicator());
// //             }
// //             if (snapshot.hasError) {
// //               if (snapshot.error is FirebaseException) {
// //                 FirebaseException firebaseError = snapshot.error as FirebaseException;
// //                 return Text("Firestore Error: ${firebaseError.code} - ${firebaseError.message}");
// //               } else {
// //                 return Text("Error: ${snapshot.error.toString()}");
// //               }
// //             }

// //             List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
// //             return ListView(
// //               children: documents.map((doc) {
// //                 Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
// //                 return Card(
// //                   child: ListTile(
// //                     title: Text("User: ${data["users"]}"),
// //                     subtitle: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                           Text("หมวด: ${data["service"]}"),
// //             Text("ปัญหา: ${data["problem"]}"),
// //             Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
// //                         // เพิ่มข้อมูลเพิ่มเติมตามต้องการ
// //                       ],
// //                     ),
// //                     onTap: () {
// //                       // ทำอะไรก็ตามเมื่อคลิกที่รายการ
// //                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => hisde(data: data)));
// //                     },
// //                   ),
// //                 );
// //               }).toList(),
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }


// ////////////////////////แก้

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class rewitingdetil extends StatefulWidget {
//   final Map<String, dynamic> data;

//   rewitingdetil({required this.data});

//   @override
//   State<rewitingdetil> createState() => _rewitingdetilState();
// }

// class _rewitingdetilState extends State<rewitingdetil> {
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
//         .doc()
//         .get();

//     setState(() {
//       firestoreData = document.data() as Map<String, dynamic>;
//     });
//   }
// void saveDataToFirestore() async {
//   print("---------------------------------------------------");
  
//   Map<String, dynamic> data = {};
              
//   data["status"] = "กำลังดำเนินการ";

//   try {
//     await FirebaseFirestore.instance
//       .collection("users")
//       .doc(widget.data["dateTime"]) // ระบุเอกสารที่ต้องการอัปเดต
//       .update(data);

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("อัปเดตข้อมูลสำเร็จ"),
//       ),
//     );

//     // เมื่ออัปเดตข้อมูลเสร็จสิ้นให้เด้งกลับไปยังหน้าก่อนหน้านี้
//     Navigator.pop(context);
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
     
//        appBar: AppBar(
//   title: const Text("รายละเอียดการแจ้งซ่อม"),
//   flexibleSpace: Container(
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [
//            Color(0xFF3EBACE),
//            Color(0xFF11998E), 
//         ],
//       ),
//     ),
//   ),
  
// ),
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

////////////

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tes/admin/rewitingdetil.dart';

import 'package:tes/appdata.dart';

class rewiting extends StatefulWidget {
  const rewiting({Key? key, required Map data}) : super(key: key);

  @override
  State<rewiting> createState() => _rewitingState();
}

class _rewitingState extends State<rewiting> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
             appBar: AppBar(
  title: const Text("คำร้องที่รอดำเนินการ"),
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
           Color(0xFF3EBACE),
           Color(0xFF11998E), 
        ],
      ),
    ),
  ),
  
),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // แสดงสถานะ "รอดำเนินการ" ขณะโหลดข้อมูล
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text("รอดำเนินการ..."),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              if (snapshot.error is FirebaseException) {
                FirebaseException firebaseError = snapshot.error as FirebaseException;
                return Text("Firestore Error: ${firebaseError.code} - ${firebaseError.message}");
              } else {
                return Text("Error: ${snapshot.error.toString()}");
              }
            }

            List<QueryDocumentSnapshot> documents = snapshot.data!.docs;


          
            // return ListView(
            //   children: documents.map((doc) {
            //     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            //       // print(doc.id.toString());
            //     return Card(
            //       child: ListTile(
            //         title: Text("user: ${data["user"]}"),
                                      

                    
            //         subtitle: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text("หมวด: ${data["service"]}"),
            //             Text("ปัญหา: ${data["problem"]}"),
            //             Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
            //             Text("status: ${data["status"]}"),

            //             // เพิ่มข้อมูลเพิ่มเติมตามต้องการ
            //           ],
            //         ),
            //         onTap: () {
            //           // ทำอะไรก็ตามเมื่อคลิกที่รายการ
            //           docid = docid.toString();
            //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => hisde(data: data)));
            //         },
            //       ),
            //     );
            //   }).toList(),
            // );

            return ListView(
  children: documents.map((doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // ตรวจสอบสถานะของข้อมูลก่อนแสดง
    if (data["status"] == "รอดำเนินการ") {
      return Card(
        child: ListTile(
          title: Text("user: ${data["user"]}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("หมวด: ${data["service"]}"),
              Text("ปัญหา: ${data["problem"]}"),
              Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
              Text("status: ${data["status"]}"),
              // เพิ่มข้อมูลเพิ่มเติมตามต้องการ
            ],
          ),
          onTap: () {
            // ทำอะไรก็ตามเมื่อคลิกที่รายการ
            docid = docid.toString();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => rewitingdetil(data: data)));
          },
        ),
      );
      
    } else {
      // ถ้าสถานะไม่ใช่ "รอดำเนินการ" ไม่ต้องแสดงข้อมูล
      return SizedBox.shrink();
    }
  }).toList(),
);

          },
        ),
      ),
    );
  }
}