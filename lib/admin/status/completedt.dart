// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Completeddetail extends StatefulWidget {
//   final Map<String, dynamic> data;

//   Completeddetail({required this.data});

//   @override
//   State<Completeddetail> createState() => _CompleteddetailState();
// }

// class _CompleteddetailState extends State<Completeddetail> {
//   Map<String, dynamic> firestoreData = {};

//   @override
//   void initState() {
//     super.initState();
//     fetchDataFromFirestore();
//   }

//   void fetchDataFromFirestore() async {
//     String documentId = widget.data["documentId"];

//     DocumentSnapshot document = await FirebaseFirestore.instance
//         .collection("verification")
//         .doc(documentId)
//         .get();

//     setState(() {
//       firestoreData = document.data() as Map<String, dynamic>;
//     });
//   }

//   // สร้างฟังก์ชันสำหรับบันทึกข้อมูลลง Firestore
//   void saveDataToFirestore() async {
//     // นำข้อมูลที่ต้องการบันทึก
//     Map<String, dynamic> newData = {
//       "service": widget.data["service"],
//       "Building": widget.data["Building"],
//       "floor": widget.data["floor"],
//       "room": widget.data["room"],
//       "problem": widget.data["problem"],
//       "Image.network":(widget.data["url"]),
//       "user": widget.data["user"],
//       "status": widget.data["status"],
      


     
//       // 
      
      
      
      
       
//       // เพิ่มข้อมูลเพิ่มเติมตามความต้องการ
//     };

//     // เพิ่มข้อมูลลง Firestore
//     await FirebaseFirestore.instance
//         .collection("waitaing") // เปลี่ยนเป็นชื่อ Collection ที่ต้องการ
//         .add(newData);

//     // แสดงข้อความหลังจากบันทึกข้อมูล
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("บันทึกข้อมูลสำเร็จ"),
//       ),
//     );
//   }

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
//                   child: Text("เสร็จสิ้น"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   }




// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Completeddetail extends StatefulWidget {
//   final Map<String, dynamic> data;

//   Completeddetail({required this.data});

//   @override
//   State<Completeddetail> createState() => _CompleteddetailState();
// }

// class _CompleteddetailState extends State<Completeddetail> {
//   Map<String, dynamic> firestoreData = {};

//   @override
//   void initState() {
//     super.initState();
//     fetchDataFromFirestore();
//   }

//   void fetchDataFromFirestore() async {
//     String documentId = widget.data["docid"];
//     // print(documentId);
//     // print("-----------------------------------------------------------------");
    
//     DocumentSnapshot document = await FirebaseFirestore.instance
//         .collection("users")
//         .doc(documentId)
//         .get();

//     setState(() {
//       firestoreData = document.data() as Map<String, dynamic>;
//     });
//   }
// void saveDataToFirestore() async {
//   // print("---------------------------------------------------");
  
//   Map<String, dynamic> data = {};
              
//   data["status"] = "เสร็จสิ้น";

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

              
//               SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // เรียกใช้ฟังก์ชันเพื่อบันทึกข้อมูล
//                     saveDataToFirestore();
//                   },
//                   child: Text("บันทึก"),
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

class Completeddetail extends StatefulWidget {
  final Map<String, dynamic> data;

  Completeddetail({required this.data});

  @override
  State<Completeddetail> createState() => _CompleteddetailState();
}

class _CompleteddetailState extends State<Completeddetail> {
  Map<String, dynamic> firestoreData = {};

  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }

  void fetchDataFromFirestore() async {
    String documentId = widget.data["documentId"]; // เราต้องมี document ID จาก Firestore

    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection("users")
        .doc()
        .get();

    setState(() {
      firestoreData = document.data() as Map<String, dynamic>;
    });
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
              if (widget.data["url"] != null)
                Image.network(widget.data["url"]), // แสดงรูปภาพถ้ามี URL
              Text("ว/ด/ป,เวลา: ${widget.data["dateTime"]}"),
               Text("status: ${widget.data["status"]}"),

              // เพิ่มรายละเอียดอื่น ๆ ตามความต้องการ
              
            ],
          ),
        ),
      ),
    );
  }
  
}
