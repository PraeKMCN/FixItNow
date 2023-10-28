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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
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
    print(item.service);
    if (catMap.containsKey(item.service) == false) {
      catMap[item.service] = 1;
    } else {
      catMap.update(item.service, (value) => value + 1);
    }
    print(catMap);
  }
  return catMap;
}


  List<Color> colorList = [
    Color.fromRGBO(82, 98, 255, 1),
    Color.fromRGBO(46, 198, 255, 1),
    Color.fromRGBO(123, 201, 82, 1),
    Color.fromRGBO(255, 171, 67, 1),
    Color.fromRGBO(252, 91, 57, 1),
    Color.fromRGBO(139, 135, 130, 1),
  ];

 Widget pieChartExampleOne() {
  return PieChart(
    key: ValueKey(key),
    dataMap: getserviceData(),
    initialAngleInDegree: 0,
    animationDuration: Duration(milliseconds: 2000),
    chartType: ChartType.ring,
    chartRadius: MediaQuery.of(context).size.width /50,  // เพิ่มขนาดของแผนภูมิ
    ringStrokeWidth: 200,  // เพิ่มความหนาของวงแหวน
    colorList: colorList,
    chartLegendSpacing: 32,
    chartValuesOptions: ChartValuesOptions(
        showChartValuesOutside: true,
        showChartValuesInPercentage: true,
        showChartValueBackground: true,
        showChartValues: true,
        chartValueStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
    // centerText: 'Expense',
    legendOptions: LegendOptions(
        showLegendsInRow: false,
        showLegends: true,
        legendShape: BoxShape.rectangle,
        legendPosition: LegendPosition.right,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )),
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
          // print(a.data());
          Expense exp = Expense.fromJson(a.data());
          _expense.add(exp);
          // print(exp);
        }
      }
    }

      return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            StreamBuilder<Object>(
              stream: expStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("something went wrong");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                final data = snapshot.requireData;
                print("Data: $data");
                getExpfromSanapshot(data);
                return pieChartExampleOne();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Expense {
  String service;


  Expense(
      {required this.service,
     });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      service: json['service'],
     
    );
  }
}

// Sample data for PiChart
Map<String, double> dataMap = {
  "ช่างประปา": 4,
  "ช่างไฟ": 3,
  "ช่างแอร์": 2,
  "ช่าคอมพิวเตอร์": 1,
};

// Sample data for Expense list

List<Expense> getExpenseList() {
  final List<Expense> chartData = [
    Expense(
        service: "ช่างประปา",
       ),
    Expense(
        service: "ช่างไฟ",
        ),
    Expense(
        service: "ช่างแอร์",
        ),
    Expense(
        service: "ช่างคอมพิวเตอร์",
       ),
    
  ];
  return chartData;
}


