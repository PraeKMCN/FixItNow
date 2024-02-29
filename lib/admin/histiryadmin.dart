

// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:tes/admin/hisadetail.dart';
// // import 'package:tes/admin/historydetail1.dart';

// // import 'package:tes/appdata.dart';

// // class historyadmin extends StatefulWidget {
// //   const historyadmin({Key? key, required Map data}) : super(key: key);

// //   @override
// //   State<historyadmin> createState() => _historyadminState();
// // }

// // class _historyadminState extends State<historyadmin> {
// //   final auth = FirebaseAuth.instance;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("ประวัติการแจ้งซ่อม"),
// //         backgroundColor: Color.fromARGB(255, 142, 212, 253),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(30),
// //         child: StreamBuilder<QuerySnapshot>(
// //           stream: FirebaseFirestore.instance.collection("users").snapshots(),
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               // แสดงสถานะ "รอดำเนินการ" ขณะโหลดข้อมูล
// //               return Center(
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     CircularProgressIndicator(),
// //                     SizedBox(height: 10),
// //                     Text("รอดำเนินการ..."),
// //                   ],
// //                 ),
// //               );
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


// //             //           ],
// //             //         ),
// //             //         onTap: () {
// //             //           // ทำอะไรก็ตามเมื่อคลิกที่รายการ
// //             //           docid = docid.toString();
// //             //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => hisde(data: data)));
// //             //         },
// //             //       ),
// //             //     );
// //             //   }).toList(),
// //             // );

// //             return ListView(
// //   children: documents.map((doc) {
// //     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

// //     // ตรวจสอบสถานะของข้อมูลก่อนแสดง
// //     // if (data["status"] == "รอดำเนินการ") {
// //       return Card(
// //         child: ListTile(
// //           title: Text("user: ${data["user"]}"),
// //           subtitle: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text("หมวด: ${data["service"]}"),
// //               Text("ปัญหา: ${data["problem"]}"),
// //               Text("ว/ด/ป,เวลา: ${data["dateTime"]}"),
// //               Text("status: ${data["status"]}"),
// //               // เพิ่มข้อมูลเพิ่มเติมตามต้องการ
// //             ],
// //           ),
// //           onTap: () {
// //             // ทำอะไรก็ตามเมื่อคลิกที่รายการ
// //             docid = docid.toString();
// //             Navigator.of(context).push(MaterialPageRoute(builder: (context) => Hisdetail(data: data)));
// //           },
// //         ),
// //       );
// //     // } 
// //     // else {
// //     //   // ถ้าสถานะไม่ใช่ "รอดำเนินการ" ไม่ต้องแสดงข้อมูล
// //     //   return SizedBox.shrink();
// //     // }
// //   }).toList(),
// // );

// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }

////////////////////////////

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tes/admin/historydetail1.dart';

class HistoryAdmin extends StatefulWidget {
  final dynamic data;

  const HistoryAdmin({Key? key, required this.data}) : super(key: key);

  @override
  State<HistoryAdmin> createState() => _HistoryAdminState();
}

class _HistoryAdminState extends State<HistoryAdmin> with SingleTickerProviderStateMixin {
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
  indicatorColor: Colors.white,
  tabs: [
    Tab(
      icon: Icon(Icons.pending_actions),
      text: "รายการแจ้งซ่อม",
    ),
    Tab(
      icon: Icon(Icons.check_circle),
      text: "รายการที่เสร็จสิ้น",
    ),
  ],
),

      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HistoryListAd(),
          SavedRepairsAdPage(),
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

class HistoryListAd extends StatelessWidget {
  const HistoryListAd({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where("status", whereIn: ["รอดำเนินการ", "กำลังดำเนินการ"])
            .orderBy("dateTime", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error.toString()}");
          }

          final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final Map<String, dynamic> data = documents[index].data() as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                      "รายการแจ้งซ่อม",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  subtitle: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: [
        Icon(Icons.category, color: Colors.blue),
        SizedBox(width: 5),
        Text(
          "หมวด: ${data["service"]}",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    Row(
      children: [
        Icon(Icons.warning, color: Colors.orange),
        SizedBox(width: 5),
        Text(
          "ปัญหา: ${data["problem"]}",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    Row(
      children: [
        Icon(Icons.calendar_today, color: Colors.green),
        SizedBox(width: 5),
        Text(
          "ว/ด/ป,เวลา: ${data["dateTime"]}",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    Row(
      children: [
        Icon(Icons.info, color: Colors.grey),
        SizedBox(width: 5),
        Text(
          "status: ${data["status"]}",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
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

class SavedRepairsAdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where("status", isEqualTo: "เสร็จสิ้น")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error.toString()}");
          }

          final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final Map<String, dynamic> data = documents[index].data() as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                      "รายการแจ้งซ่อม",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
               subtitle: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: [
        Icon(Icons.category, color: Colors.blue),
        SizedBox(width: 5),
        Text(
          "หมวด: ${data["service"]}",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    Row(
      children: [
        Icon(Icons.warning, color: Colors.orange),
        SizedBox(width: 5),
        Text(
          "ปัญหา: ${data["problem"]}",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    Row(
      children: [
        Icon(Icons.calendar_today, color: Colors.green),
        SizedBox(width: 5),
        Text(
          "ว/ด/ป,เวลา: ${data["dateTime"]}",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    Row(
      children: [
        Icon(Icons.info, color: Colors.grey),
        SizedBox(width: 5),
        Text(
          "status: ${data["status"]}",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
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
    Row(
      children: [
        Icon(Icons.category, color: Colors.blue),
        SizedBox(width: 5),
        Text(
          "หมวด: ${data["service"]}",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    Row(
      children: [
        Icon(Icons.warning, color: Colors.orange),
        SizedBox(width: 5),
        Text(
          "ปัญหา: ${data["problem"]}",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    Row(
      children: [
        Icon(Icons.calendar_today, color: Colors.green),
        SizedBox(width: 5),
        Text(
          "ว/ด/ป,เวลา: ${data["dateTime"]}",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    Row(
      children: [
        Icon(Icons.info, color: Colors.grey),
        SizedBox(width: 5),
        Text(
          "status: ${data["status"]}",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
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
