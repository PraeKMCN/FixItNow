
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tes/admin/status/inprogressde.dart';

import 'package:tes/appdata.dart';

class inprogress extends StatefulWidget {
  const inprogress({Key? key, required Map data}) : super(key: key);

  @override
  State<inprogress> createState() => _inprogressState();
}

class _inprogressState extends State<inprogress> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
             appBar: AppBar(
  title: const Text("กำลังดำเนินการ"),
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
    if (data["status"] == "กำลังดำเนินการ") {
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
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => inprogressde(data: data)));
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