
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class historyredetail extends StatefulWidget {
  final Map<String, dynamic> data;

  historyredetail({required this.data});

  @override
  State<historyredetail> createState() => _historyredetailState();
}

class _historyredetailState extends State<historyredetail> {
  Map<String, dynamic> firestoreData = {};

  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }

  void fetchDataFromFirestore() async {
    String documentId =
        widget.data["documentId"]; // เราต้องมี document ID จาก Firestore

    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection("users")
        .doc(documentId)
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
