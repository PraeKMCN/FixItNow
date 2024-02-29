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
///

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tes/user/historydetail.dart';
// class History extends StatefulWidget {
//   final dynamic data; // Declare data as an instance field

//   const History({Key? key, required this.data}) : super(key: key);

//   @override
//   State<History> createState() => _HistoryState();
// }

// class _HistoryState extends State<History> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("ประวัติการแจ้งซ่อม"),
//         backgroundColor: const Color.fromARGB(255, 142, 212, 253),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {
//               // เมื่อกดปุ่มค้นหา
//               _openSearchPage(context);
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(30),
//         child: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection("users")
//               .where("user", isEqualTo: _auth.currentUser!.email)
//               .orderBy("dateTime", descending: true)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (snapshot.hasError) {
//               if (snapshot.error is FirebaseException) {
//                 final FirebaseException firebaseError = snapshot.error as FirebaseException;
//                 return Text("เกิดข้อผิดพลาด: ${firebaseError.code} - ${firebaseError.message}");
//               } else {
//                 return Text("เกิดข้อผิดพลาด: ${snapshot.error.toString()}");
//               }
//             }

//             final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
//             return ListView(
//               children: documents.map((doc) {
//                 final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//                 return Card(
//                   child: ListTile(
//                     title: const Text("รายการแจ้งซ่อม"),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("หมวด: ${data["service"]}"),
//                         Text("ปัญหา: ${data["problem"]}"),
//                         Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
//                       ],
//                     ),
//                     onTap: () {
//                       // เมื่อคลิกที่รายการ
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => historydetail(data: data),
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

//  _openSearchPage(BuildContext context) async {
//   try {
//     final FirebaseAuth _auth = FirebaseAuth.instance; // Define _auth here
//     final historyData = await _retrieveHistoryData(_auth);
//     showSearch(
//       context: context,
//       delegate: CustomSearchDelegate(historyData: historyData),
//     );
//   } catch (error) {
//     print("เกิดข้อผิดพลาดในการเปิดหน้าค้นหา: $error");
//     // Handle error appropriately, such as showing a snackbar or dialog
//   }
// }


//   Future<List<Map<String, dynamic>>> _retrieveHistoryData(FirebaseAuth auth) async {
//     final List<Map<String, dynamic>> historyData = [];
//     try {
//       final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection("users")
//           .where("user", isEqualTo: auth.currentUser!.email)
//           .orderBy("dateTime", descending: true)
//           .get();

//       querySnapshot.docs.forEach((doc) {
//         historyData.add(doc.data() as Map<String, dynamic>); // Cast to the correct type
//       });

//     } catch (error) {
//       print("เกิดข้อผิดพลาดในการดึงข้อมูล: $error");
//       throw error; // Rethrow the error
//     }
//     return historyData;
//   }
// }

// class CustomSearchDelegate extends SearchDelegate {
//   final List<Map<String, dynamic>> historyData;
//   final List<Map<String, dynamic>> filteredData;

//   CustomSearchDelegate({required this.historyData})
//       : filteredData = List.from(historyData);

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//           showSuggestions(context);
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return buildSearchResults();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return buildSearchResults();
//   }

//   Widget buildSearchResults() {
//     filteredData.clear();
//     filteredData.addAll(historyData.where((data) {
//       final String queryLower = query.toLowerCase();
//       final String serviceLower = data['service'].toLowerCase();
//       final String problemLower = data['problem'].toLowerCase();
//       return serviceLower.contains(queryLower) || problemLower.contains(queryLower);
//     }));

//     return ListView.builder(
//       itemCount: filteredData.length,
//       itemBuilder: (context, index) {
//         final Map<String, dynamic> data = filteredData[index];
//         return Card(
//           child: ListTile(
//             title: const Text("รายการแจ้งซ่อม"),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("หมวด: ${data["service"]}"),
//                 Text("ปัญหา: ${data["problem"]}"),
//                 Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
//               ],
//             ),
//             onTap: () {
//               // เมื่อคลิกที่รายการในการค้นหา
//               // Navigator.of(context).push(
//               //   MaterialPageRoute(
//               //     builder: (context) => HistoryDetail(data: data),
//               //   ),
//               // );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tes/user/historydetail.dart';

class History extends StatefulWidget {
  final dynamic data;

  const History({Key? key, required this.data}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with SingleTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  title: const Text("ประวัติการแจ้งซ่อม"),
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
  actions: [
    IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {
        _openSearchPage(context);
      },
    ),
  ],
 bottom: TabBar(
  controller: _tabController,
  indicatorColor: Colors.white, // กำหนดสีของ Tab indicator เป็นสีขาว
  tabs: [
    Tab(text: "การแจ้งซ่อม"),
    Tab(text: "บันทึกการแจ้งซ่อม"),
  ],
),

),

      body: TabBarView(
        controller: _tabController,
        children: [
          HistoryList(),
          SavedRepairsPage(),
        ],
      ),
  
    );
  }

  void _openSearchPage(BuildContext context) async {
    try {
      final historyData = await _retrieveHistoryData();
      showSearch(
        context: context,
        delegate: CustomSearchDelegate(historyData: historyData),
      );
    } catch (error) {
      print("Error opening search page: $error");
      // Handle error appropriately, such as showing a snackbar or dialog
    }
  }

  Future<List<Map<String, dynamic>>> _retrieveHistoryData() async {
    final List<Map<String, dynamic>> historyData = [];
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .where("user", isEqualTo: _auth.currentUser!.email)
          .orderBy("dateTime", descending: true)
          .get();

      querySnapshot.docs.forEach((doc) {
        historyData.add(doc.data() as Map<String, dynamic>);
      });
    } catch (error) {
      print("Error retrieving data: $error");
      throw error;
    }
    return historyData;
  }
}

class HistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16), // Reduce padding for a more compact layout
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where("user", isEqualTo: FirebaseAuth.instance.currentUser!.email)
            .orderBy("dateTime", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            if (snapshot.error is FirebaseException) {
              final FirebaseException firebaseError = snapshot.error as FirebaseException;
              return Text("Error: ${firebaseError.code} - ${firebaseError.message}");
            } else {
              return Text("Error: ${snapshot.error.toString()}");
            }
          }

          final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final Map<String, dynamic> data = documents[index].data() as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8), // Add vertical spacing between list items
                child: Card(
                  elevation: 3, // Add elevation for a shadow effect
                  child: ListTile(
                    title: Text(
                      "รายการแจ้งซ่อม",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("หมวด: ${data["service"]}"),
                        Text("ปัญหา: ${data["problem"]}"),
                        Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
                        Text("status: ${data["status"]}"),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => historydetail(data: data),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SavedRepairsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("บันทึกการแจ้งซ่อม"),
    );
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
        icon: const Icon(Icons.clear),
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
      icon: const Icon(Icons.arrow_back),
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
      final String queryLower = query.toLowerCase();
      final String serviceLower = data['service'].toLowerCase();
      final String problemLower = data['problem'].toLowerCase();
      return serviceLower.contains(queryLower) || problemLower.contains(queryLower);
    }));

    return ListView.builder(
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        final Map<String, dynamic> data = filteredData[index];
        return Card(
          child: ListTile(
            title: const Text("รายการแจ้งซ่อม"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("หมวด: ${data["service"]}"),
                Text("ปัญหา: ${data["problem"]}"),
                Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
                Text("status: ${data["status"]}"),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => historydetail(data: data)));
            },
          ),
        );
      },
    );
  }
}


