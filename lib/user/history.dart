// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:tes/user/historydetail.dart';

// class History extends StatefulWidget {
//   const History({super.key});

//   @override
//   State<History> createState() => _HistoryState();
// }

// class _HistoryState extends State<History> {
//   List listItems = [];
//   final auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("ประวัติการแจ้งซ่อม"), backgroundColor: Color.fromARGB(255, 142, 212, 253),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(30),
//         child: Column(
//           children: [showItem()],
//         ),
//       ),
//     );
//   }

//   Widget showItem() {
//     return FutureBuilder(
//       future: item1(),
//       builder: (context, AsyncSnapshot snapshot) {
//         if (snapshot.hasData) {
//           return listItems.isNotEmpty
//               ? Column(
//                   children: listItems.map((val) {
//                     return Card(
//                       child: ListTile(
//                         title: Text("รายการแจ้งซ่อม"),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("หมวด: ${val["service"]}"),
//                             Text("ปัญหา: ${val["problem"]}"),
//                             Text("ว/ด/ป,เวลา: ${val["dateTime"]}"),
//                           ],
//                         ),
//                         onTap: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => HistoryDetail(data: val),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   }).toList(),
//                 )
//               : Text("ไม่มีข้อมูล");
//         }
//         return Container();
//       },
//     );
//   }

//   Future item1() async {
//     FirebaseFirestore.instance
//         .collection("users")
//         .where("user", isEqualTo: auth.currentUser!.email)
//         .snapshots()
//         .listen((event) {
//       listItems = [];
//       event.docs.map((val) => listItems.add(val.data())).toList();
//       // print(listItems);
//     });

//     return listItems;
//   }
// }
/////////////////////////////////////////////////////////////////
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tes/user/historydetail.dart';

// class History extends StatefulWidget {
//   const History({Key? key}) : super(key: key);

//   @override
//   State<History> createState() => _HistoryState();
// }

// class _HistoryState extends State<History> {
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
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection("users")
//                     .where("user", isEqualTo: auth.currentUser!.email)
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   }
//                   if (snapshot.hasError) {
//                     return Text("เกิดข้อผิดพลาด: ${snapshot.error}");
//                   }
//                   if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                     return Text("ไม่มีข้อมูล");
//                   }

//                   List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
//                   return Column(
//                     children: documents.map((doc) {
//                       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//                       return Card(
//                         child: ListTile(
//                           title: Text("รายการแจ้งซ่อม"),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("หมวด: ${data["service"]}"),
//                               Text("ปัญหา: ${data["problem"]}"),
//                               Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
//                             ],
//                           ),
//                           onTap: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => HistoryDetail(data: data),
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     }).toList(),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

///////////////////////////////////////////โค้ดที่ใช้ปัจจุบัน////////////////////////////////////////////

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tes/user/historydetail.dart';

// class History extends StatefulWidget {
//   const History({Key? key}) : super(key: key);

//   @override
//   State<History> createState() => _HistoryState();
// }

// class _HistoryState extends State<History> {
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
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => HistoryDetail(data: data),
//                         ),
//                       );
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



///////////////////////////////////////////โค้ดที่ใช้ปัจจุบัน////////////////////////////////////////////
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ประวัติการแจ้งซ่อม"),
        backgroundColor: Color.fromARGB(255, 142, 212, 253),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // เมื่อกดปุ่มค้นหา
              _openSearchPage(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .where("user", isEqualTo: auth.currentUser!.email)
              .orderBy("dateTime", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              if (snapshot.error is FirebaseException) {
                FirebaseException firebaseError = snapshot.error as FirebaseException;
                return Text("เกิดข้อผิดพลาด: ${firebaseError.code} - ${firebaseError.message}");
              } else {
                return Text("เกิดข้อผิดพลาด: ${snapshot.error.toString()}");
              }
            }

            List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
            return ListView(
              children: documents.map((doc) {
                Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                return Card(
                  child: ListTile(
                    title: Text("รายการแจ้งซ่อม"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("หมวด: ${data["service"]}"),
                        Text("ปัญหา: ${data["problem"]}"),
                        Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
                      ],
                    ),
                    onTap: () {
                      // เมื่อคลิกที่รายการ
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HistoryDetail(data: data),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  void _openSearchPage(BuildContext context) {
    // เปิดหน้าค้นหา
    showSearch(
      context: context,
      delegate: CustomSearchDelegate(historyData: _retrieveHistoryData()),
    );
  }

  List<Map<String, dynamic>> _retrieveHistoryData() {
    // ฟังก์ชันนี้ใช้เพื่อดึงข้อมูลประวัติการแจ้งซ่อม
    // จำลองข้อมูลหรือดึงจาก Firestore ตามต้องการ
    return [
      {"service": "บริการ 1", "problem": "ปัญหา 1", "dateTime": "2023-01-01 12:00:00"},
      {"service": "บริการ 2", "problem": "ปัญหา 2", "dateTime": "2023-01-02 14:30:00"},
      {"service": "บริการ 3", "problem": "ปัญหา 3", "dateTime": "2023-01-03 10:45:00"},
      // เพิ่มข้อมูลเพิ่มเติมตามต้องการ
    ];
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> historyData;
  final List<Map<String, dynamic>> filteredData;

  CustomSearchDelegate({required this.historyData})
      : filteredData = List.from(historyData);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildSearchResults();
  }

  Widget buildSearchResults() {
    filteredData.clear();
    filteredData.addAll(historyData.where((data) {
      String queryLower = query.toLowerCase();
      String serviceLower = data['service'].toLowerCase();
      String problemLower = data['problem'].toLowerCase();
      return serviceLower.contains(queryLower) || problemLower.contains(queryLower);
    }));

    return ListView.builder(
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> data = filteredData[index];
        return Card(
          child: ListTile(
            title: Text("รายการแจ้งซ่อม"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("หมวด: ${data["service"]}"),
                Text("ปัญหา: ${data["problem"]}"),
                Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
              ],
            ),
            onTap: () {
              // เมื่อคลิกที่รายการในการค้นหา
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HistoryDetail(data: data),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class HistoryDetail extends StatelessWidget {
  final Map<String, dynamic> data;

  const HistoryDetail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายละเอียดการแจ้งซ่อม"),
        backgroundColor: Color.fromARGB(255, 142, 212, 253),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("หมวด: ${data["service"]}"),
            Text("ปัญหา: ${data["problem"]}"),
            Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
            // เพิ่มข้อมูลเพิ่มเติมตามต้องการ
          ],
        ),
      ),
    );
  }
}
