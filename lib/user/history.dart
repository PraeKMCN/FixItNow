import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tes/user/historydetail.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List listItems = [];
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ประวัติการแจ้งซ่อม"), backgroundColor: Color.fromARGB(255, 142, 212, 253),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [showItem()],
        ),
      ),
    );
  }

  Widget showItem() {
    return FutureBuilder(
      future: item1(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return listItems.isNotEmpty
              ? Column(
                  children: listItems.map((val) {
                    return Card(
                      child: ListTile(
                        title: Text("รายการแจ้งซ่อม"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("หมวด: ${val["service"]}"),
                            Text("ปัญหา: ${val["problem"]}"),
                            Text("ว/ด/ป,เวลา: ${val["dateTime"]}"),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HistoryDetail(data: val),
                            ),
                          );
                        },
                      ),
                    );
                  }).toList(),
                )
              : Text("ไม่มีข้อมูล");
        }
        return Container();
      },
    );
  }

  Future item1() async {
    FirebaseFirestore.instance
        .collection("users")
        .where("user", isEqualTo: auth.currentUser!.email)
        .snapshots()
        .listen((event) {
      listItems = [];
      event.docs.map((val) => listItems.add(val.data())).toList();
      // print(listItems);
    });

    return listItems;
  }
}
