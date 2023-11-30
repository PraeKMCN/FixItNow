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
//////////////////////////////////////////////////////////////////////////////////////////
///

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:pie_chart/pie_chart.dart';

// class PieChartPage extends StatefulWidget {
//   @override
//   _PieChartPageState createState() => _PieChartPageState();
// }

// class _PieChartPageState extends State<PieChartPage> {
//   int key = 0;

//   late List<Expense> _expense = [];

//   Map<String, double> getserviceData() {
//     Map<String, double> catMap = {};
//     for (var item in _expense) {
//       print(item.service);
//       if (catMap.containsKey(item.service) == false) {
//         catMap[item.service] = 1;
//       } else {
//         catMap.update(item.service, (value) => value + 1);
//       }
//       print(catMap);
//     }
//     return catMap;
//   }

//   List<Color> colorList = [
//     const Color.fromRGBO(82, 98, 255, 1),
//     const Color.fromRGBO(46, 198, 255, 1),
//     const Color.fromRGBO(123, 201, 82, 1),
//     const Color.fromRGBO(255, 171, 67, 1),

//   ];

//   Widget pieChartExampleOne() {
//     return PieChart(
//       key: ValueKey(key),
//       dataMap: getserviceData(),
//       initialAngleInDegree: 0,
//       animationDuration: const Duration(milliseconds: 2000),
//       chartType: ChartType.ring,
//       chartRadius:
//           MediaQuery.of(context).size.width / 50, // เพิ่มขนาดของแผนภูมิ
//       ringStrokeWidth: 200, // เพิ่มความหนาของวงแหวน
//       colorList: colorList,
//       chartLegendSpacing: 32,
//       chartValuesOptions: const ChartValuesOptions(
//           showChartValuesOutside: true,
//           showChartValuesInPercentage: true,
//           showChartValueBackground: true,
//           showChartValues: true,
//           chartValueStyle:
//               TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
//               ),
//       // centerText: 'Expense',
//       legendOptions: const LegendOptions(
//         showLegendsInRow: false,
//         showLegends: true,
//         legendShape: BoxShape.rectangle,
//         legendPosition: LegendPosition.right,
//         // legendTextStyle: TextStyle(
//         //   fontWeight: FontWeight.bold,
//         //   color: Colors.black,
//         // ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Stream<QuerySnapshot> expStream =
//         FirebaseFirestore.instance.collection('users').snapshots();

//     void getExpfromSanapshot(snapshot) {
//       if (snapshot.docs.isNotEmpty) {
//         _expense = [];
//         for (int i = 0; i < snapshot.docs.length; i++) {
//           var a = snapshot.docs[i];
//           // print(a.data());
//           Expense exp = Expense.fromJson(a.data());
//           _expense.add(exp);
//           // print(exp);
//         }
//       }
//     }

//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(
//             height: 50,
//           ),
//           StreamBuilder<Object>(
//             stream: expStream,
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return const Text("something went wrong");
//               }
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const CircularProgressIndicator();
//               }
//               final data = snapshot.requireData;
//               print("Data: $data");
//               getExpfromSanapshot(data);
//               return pieChartExampleOne();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Expense {
//   final String service;

//   Expense({required this.service});

//   factory Expense.fromJson(Map<String, dynamic> json) {
//     return Expense(service: json['service'] as String);
//   }
// }

// // Sample data for Expense list
// List<Expense> getExpenseList() {
//   final List<Expense> chartData = [
//     // แทนค่าในลิสต์นี้ด้วยข้อมูลจริงที่คุณดึงมาจาก Firestore
//     Expense(
//       service: "ช่างประปา",
//     ),
//     Expense(
//       service: "ช่างไฟ",
//     ),
//     Expense(
//       service: "ช่างแอร์",
//     ),
//     Expense(
//       service: "ช่างคอมพิวเตอร์",
//     ),
//   ];
//   return chartData;
// }

// // แทนค่าใน dataMap ด้วยข้อมูลจริงที่คุณดึงมาจาก Firestore
// Map<String, double> dataMap = {
//   "ช่างประปา": 0,
//   "ช่างไฟฟ้า": 0,
//   "ช่างแอร์": 0,
//   "ช่างคอมพิวเตอร์": 0,
// };

///////////////////////////////////////////////////////////////////////////////

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartPage extends StatefulWidget {
  @override
  _PieChartPageState createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  int key = 0;
  late List<Expense> _expense = [];

  Map<String, double> getserviceData() {
    Map<String, double> catMap = {};
    for (var item in _expense) {
      if (catMap.containsKey(item.service) == false) {
        catMap[item.service] = 1;
      } else {
        catMap.update(item.service, (value) => value + 1);
      }
    }
    return catMap;
  }

  List<Color> colorList = [
    const Color.fromRGBO(82, 98, 255, 1),
    const Color.fromRGBO(46, 198, 255, 1),
    const Color.fromRGBO(123, 201, 82, 1),
    const Color.fromRGBO(255, 171, 67, 1),
  ];

  Widget pieChartExampleOne() {
    return PieChart(
      key: ValueKey(key),
      dataMap: getserviceData(),
      initialAngleInDegree: 0,
      animationDuration: const Duration(milliseconds: 2000),
      chartType: ChartType.ring,
      chartRadius: MediaQuery.of(context).size.width / 4,
      ringStrokeWidth: 150,
      colorList: colorList,
      chartLegendSpacing: 100,
      chartValuesOptions: const ChartValuesOptions(
        showChartValuesOutside: true,
        showChartValuesInPercentage: true,
        showChartValueBackground: true,
        showChartValues: true,
        chartValueStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        showLegends: true,
        legendShape: BoxShape.rectangle,
        legendPosition: LegendPosition.bottom,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> expStream =
        FirebaseFirestore.instance.collection('users').snapshots();

    void getExpfromSanapshot(snapshot) {
      if (snapshot.docs.isNotEmpty) {
        _expense = [];
        for (int i = 0; i < snapshot.docs.length; i++) {
          var a = snapshot.docs[i];
          Expense exp = Expense.fromJson(a.data());
          _expense.add(exp);
        }
      }
    }

    return Scaffold(
//appBar: AppBar(
//   title: Align(
//     alignment: Alignment.centerLeft,
//     child: Text(
//       "สถิติการเรียกใช้บริการงานช่างแต่ละหมวด",
//       style: TextStyle(
//         color: Color.fromARGB(255, 0, 7, 14),
//       ),
//     ),
//   ),
//   centerTitle: false, // ไม่จัดตำแหน่งข้อความตรงกลาง
//   backgroundColor: Colors.transparent,
//   elevation: 0,
// ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          StreamBuilder<Object>(
            stream: expStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              final data = snapshot.requireData;
              getExpfromSanapshot(data);
              return pieChartExampleOne();
            },
          ),
        ],
      ),
    );
  }
}

class Expense {
  final String service;

  Expense({required this.service});

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(service: json['service'] as String);
  }
}