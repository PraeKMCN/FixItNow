import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:tes/user/graph1.dart';
import 'package:tes/user/reportForm.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "หน้าหลัก",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 142, 212, 253),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'สถิติการเรียกใช้บริการงานช่าง', // เพิ่มข้อความเหนือแผนภูมิ
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 200,
              height: 200,
              child: PieChartPage(),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    // Add code to navigate to the repair request screen here
                    // For example:
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ReportForm();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 142, 212, 253),
                    minimumSize: Size(150, 40),
                  ),
                  child: Text(
                    'แจ้งซ่อม',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "หน้าหลัก",
//             style: TextStyle(
//               fontSize: 20, // ตั้งค่าขนาดข้อความ
//             ),
//           ),
//           backgroundColor: Color.fromARGB(
//               0255, 142, 212, 253), // ตั้งค่าสีพื้นหลังเป็นค่า透เนียก
//           elevation: 0,
//           // ตั้งค่าเงาของ AppBar เป็น 0
//         ),
//         body: SafeArea(
//             child: Container(
//           color: Color.fromARGB( 0255, 142, 212, 253),
//           child: Column(children: <Widget>[
//             GridView.count(
//                 shrinkWrap: true,
//                 primary: true,
//                 crossAxisCount: 2,
//                 children: <Widget>[
//                AnimationPage(),
//                 ])
//           ]),
//         )));
//   }
// }



//////////////////////////////////////////////////////////////
  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       // เพิ่มโค้ดเมื่อ Container ถูกคลิก
                  //       // ตัวอย่าง: นำทางไปยังหน้าอื่น
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) {
                  //         // เพิ่มหน้าที่คุณต้องการนำทางไปยังที่นี่
                  //         return ReportForm();
                  //       }));
                  //     },
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(25),
                  //         color: Colors.white,
                  //       ),
                  //       child: Stack(
                  //         alignment: Alignment.bottomCenter,
                  //         children: [

                  //           Padding(
                  //               padding: const EdgeInsets.only(bottom: 20.0),
                  //               child: Image.asset(
                  //                 "assets/e.jpg",
                  //                 height: 125,
                  //                 width: 125,
                  //               ) // คุณสามารถเปลี่ยนแหล่งรูปภาพได้ที่นี่
                  //               ),
                  //           Text(
                  //             "ช่างไฟฟ้า", // คุณสามารถเปลี่ยนเนื้อหาข้อความได้ที่นี่
                  //             style: TextStyle(fontSize: 16),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       // เพิ่มโค้ดเมื่อ Container ถูกคลิก
                  //       // ตัวอย่าง: นำทางไปยังหน้าอื่น
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) {
                  //         // เพิ่มหน้าที่คุณต้องการนำทางไปยังที่นี่
                  //         return ReportForm();
                  //       }));
                  //     },
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(25),
                  //         color: Colors.white,
                  //       ),
                  //       child: Stack(
                  //         alignment: Alignment.bottomCenter,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.only(bottom: 20.0),
                  //             child: Image.asset(
                  //               "assets/a.jpg",
                  //               height: 125,
                  //               width: 125,
                  //             ), // คุณสามารถเปลี่ยนแหล่งรูปภาพได้ที่นี่
                  //           ),
                  //           Text(
                  //             "ช่างแอร์", // คุณสามารถเปลี่ยนเนื้อหาข้อความได้ที่นี่
                  //             style: TextStyle(fontSize: 16),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       // เพิ่มโค้ดเมื่อ Container ถูกคลิก
                  //       // ตัวอย่าง: นำทางไปยังหน้าอื่น
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) {
                  //         // เพิ่มหน้าที่คุณต้องการนำทางไปยังที่นี่
                  //         return ReportForm();
                  //       }));
                  //     },
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(25),
                  //         color: Colors.white,
                  //       ),
                  //       child: Stack(
                  //         alignment: Alignment.bottomCenter,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.only(bottom: 20.0),
                  //             child: Image.asset(
                  //               "assets/p.jpg",
                  //               height: 125,
                  //               width: 125,
                  //             ), // คุณสามารถเปลี่ยนแหล่งรูปภาพได้ที่นี่
                  //           ),
                  //           Text(
                  //             "ช่างปะปา", // คุณสามารถเปลี่ยนเนื้อหาข้อความได้ที่นี่
                  //             style: TextStyle(fontSize: 16),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.all(20.0),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       // เพิ่มโค้ดเมื่อ Container ถูกคลิก
                  //       // ตัวอย่าง: นำทางไปยังหน้าอื่น
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) {
                  //         // เพิ่มหน้าที่คุณต้องการนำทางไปยังที่นี่
                  //         return ReportForm();
                  //       }));
                  //     },
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(25),
                  //         color: Colors.white,
                  //       ),
                  //       child: Stack(
                  //         alignment: Alignment.bottomCenter,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.only(bottom: 20.0),
                  //             child: Image.asset(
                  //               "assets/c.jpg",
                  //               height: 125,
                  //               width: 125,
                  //             ), // คุณสามารถเปลี่ยนแหล่งรูปภาพได้ที่นี่
                  //           ),
                  //           Text(
                  //             "ช่างคอมพิวเตอร์", // คุณสามารถเปลี่ยนเนื้อหาข้อความได้ที่นี่
                  //             style: TextStyle(fontSize: 16),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // AnimationPage(),
                
              