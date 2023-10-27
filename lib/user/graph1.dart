// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class PieChartSample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   // title: Text('Pie Chart Example'),
//       // ),
//       body: Center(
//         child: Padding(
//             padding: const EdgeInsets.only(top: 45.0),
//           child: PieChart(
//             PieChartData(
//               sections: [
//                 PieChartSectionData(
//                   color: Colors.blue,
//                   value: 50,
//                   title: 'ข้อมูล1',
//                   radius: 75,
//                 ),
//                 PieChartSectionData(
//                   color: Colors.green,
//                   value: 50,
//                   title: 'ข้อมูล2',
//                   radius: 75,
//                 ),
//                 PieChartSectionData(
//                   color: Colors.red,
//                   value: 50,
//                   title: 'ข้อมูล3',
//                   radius: 75,
//                 ),
//                 PieChartSectionData(
//                   color: Colors.orange,
//                   value: 50,
//                   title: 'ข้อมูล4',
//                   radius: 75,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartSample extends StatefulWidget {
  @override
  _PieChartSampleState createState() => _PieChartSampleState();
}

class _PieChartSampleState extends State<PieChartSample> {
  List<PieChartSectionData> pieChartSections = [];

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp(); // แน่ใจว่าคุณเรียก Firebase.initializeApp() ก่อนใช้ Firestore

    fetchDataFromFirestore().then((data) {
      pieChartSections = data.map((document) {
        int value = document['value'];
        String title = document['title'];

        return PieChartSectionData(
          color: Color(int.parse(document['color'])),
          value: value.toDouble(),
          title: title,
          radius: 75,
        );
      }).toList();
      setState(() {});
    });
  }

  Future<List<QueryDocumentSnapshot>> fetchDataFromFirestore() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection('your_collection_name').get();
    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PieChart(
            PieChartData(
              sections: pieChartSections,
              centerSpaceRadius: 40,
              sectionsSpace: 6,
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
      ),
    );
  }
}

