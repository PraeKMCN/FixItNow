
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tes/appdata.dart';

// class inprogressde extends StatefulWidget {
//   final Map<String, dynamic> data;

//   inprogressde({required this.data});

//   @override
//   State<inprogressde> createState() => _inprogressdeState();
// }

// class _inprogressdeState extends State<inprogressde> {
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
//                   .doc("2024-02-05 11:49:37.455515")
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
//        appBar: AppBar(
//   title: const Text("กำลังดำเนินการ"),
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
  
//       ),
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



import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tes/appdata.dart';

class inprogressde extends StatefulWidget {
  final Map<String, dynamic> data;

  inprogressde({required this.data});

  @override
  State<inprogressde> createState() => _inprogressdeState();
}

class _inprogressdeState extends State<inprogressde> {
  Map<String, dynamic> firestoreData = {};

  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }

  void fetchDataFromFirestore() async {
    // String documentId = widget.data["docid"];
    // print(documentId);
    // print("-----------------------------------------------------------------");
    
    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection("users")
        .doc()
        .get();

    setState(() {
      firestoreData = document.data() as Map<String, dynamic>;
    });
  }
void saveDataToFirestore() async {
  print("---------------------------------------------------");
  
  Map<String, dynamic> data = {};
              
  data["status"] = "เสร็จสิ้น";

  try {
    await FirebaseFirestore.instance
      .collection("users")
      .doc(widget.data["dateTime"]) // ระบุเอกสารที่ต้องการอัปเดต
      .update(data);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("อัปเดตข้อมูลสำเร็จ"),
      ),
    );

    // เมื่ออัปเดตข้อมูลเสร็จสิ้นให้เด้งกลับไปยังหน้าก่อนหน้านี้
    Navigator.pop(context);
  } catch (e) {
    print("Error updating status: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error updating status: $e"),
      ),
    );
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
       appBar: AppBar(
  title: const Text("รายละเอียดการแจ้งซ่อม"),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("หมวด: ${widget.data["service"]}"),
              Text("อาคาร: ${widget.data["Building"]}"),
              Text("ชั้น: ${widget.data["floor"]}"),
              Text("ห้อง: ${widget.data["room"]}"),
              Text("ปัญหา: ${widget.data["problem"]}"),
              Text("status:${widget.data["status"]}"),
              if (widget.data["url"] != null)
                Image.network(widget.data["url"]),

              Text("ว/ด/ป,เวลา: ${widget.data["dateTime"]}"),

              
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // เรียกใช้ฟังก์ชันเพื่อบันทึกข้อมูล
                    saveDataToFirestore();
                  },
                  child: Text("เสร็จสิ้น"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
