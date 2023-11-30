

// class HomeScreen extends StatelessWidget {
//   final auth = FirebaseAuth.instance;
//   List listItems = [];
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
//           child: Container(
//             color: Color.fromARGB(255, 142, 212, 253),
//             child: Column(
//               children: <Widget>[
//                 GridView.count(
//                   shrinkWrap: true,
//                   primary: true,
//                   crossAxisCount: 2,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           // เพิ่มโค้ดเมื่อ Container ถูกคลิก
//                           // ตัวอย่าง: นำทางไปยังหน้าอื่น
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             // เพิ่มหน้าที่คุณต้องการนำทางไปยังที่นี่
//                             return ReportForm();
//                           }));
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                             color: Colors.white,
//                           ),
//                           child: Stack(
//                             alignment: Alignment.bottomCenter,
//                             children: [
//                               Padding(
//                                   padding: const EdgeInsets.only(bottom: 20.0),
//                                   child: Image.asset(
//                                     "assets/e.jpg",
//                                     height: 125,
//                                     width: 125,
//                                   ) // คุณสามารถเปลี่ยนแหล่งรูปภาพได้ที่นี่
//                                   ),
//                               Text(
//                                 "ช่างไฟฟ้า", // คุณสามารถเปลี่ยนเนื้อหาข้อความได้ที่นี่
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           // เพิ่มโค้ดเมื่อ Container ถูกคลิก
//                           // ตัวอย่าง: นำทางไปยังหน้าอื่น
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             // เพิ่มหน้าที่คุณต้องการนำทางไปยังที่นี่
//                             return ReportForm();
//                           }));
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                             color: Colors.white,
//                           ),
//                           child: Stack(
//                             alignment: Alignment.bottomCenter,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 20.0),
//                                 child: Image.asset(
//                                   "assets/a.jpg",
//                                   height: 125,
//                                   width: 125,
//                                 ), // คุณสามารถเปลี่ยนแหล่งรูปภาพได้ที่นี่
//                               ),
//                               Text(
//                                 "ช่างแอร์", // คุณสามารถเปลี่ยนเนื้อหาข้อความได้ที่นี่
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           // เพิ่มโค้ดเมื่อ Container ถูกคลิก
//                           // ตัวอย่าง: นำทางไปยังหน้าอื่น
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             // เพิ่มหน้าที่คุณต้องการนำทางไปยังที่นี่
//                             return ReportForm();
//                           }));
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                             color: Colors.white,
//                           ),
//                           child: Stack(
//                             alignment: Alignment.bottomCenter,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 20.0),
//                                 child: Image.asset(
//                                   "assets/p.jpg",
//                                   height: 125,
//                                   width: 125,
//                                 ), // คุณสามารถเปลี่ยนแหล่งรูปภาพได้ที่นี่
//                               ),
//                               Text(
//                                 "ช่างปะปา", // คุณสามารถเปลี่ยนเนื้อหาข้อความได้ที่นี่
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),

//                     // Container 4 (Similar to Container 1)
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: GestureDetector(
//                         onTap: () {
//                           // เพิ่มโค้ดเมื่อ Container ถูกคลิก
//                           // ตัวอย่าง: นำทางไปยังหน้าอื่น
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             // เพิ่มหน้าที่คุณต้องการนำทางไปยังที่นี่
//                             return ReportForm();
//                           }));
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                             color: Colors.white,
//                           ),
//                           child: Stack(
//                             alignment: Alignment.bottomCenter,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 20.0),
//                                 child: Image.asset(
//                                   "assets/c.jpg",
//                                   height: 125,
//                                   width: 125,
//                                 ), // คุณสามารถเปลี่ยนแหล่งรูปภาพได้ที่นี่
//                               ),
//                               Text(
//                                 "ช่างคอมพิวเตอร์", // คุณสามารถเปลี่ยนเนื้อหาข้อความได้ที่นี่
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Divider(
//                   color: Colors.grey.shade600,
//                 ),

//                 // Center(
//                 //   child: FilledButton(
//                 //     child: Text("กลับหน้าหลัก"),
//                 //     onPressed: () {},
//                 //   ),
//                 // )
//               ],
//             ),
//           ),
//         ));
//   }
// }

// class HistoryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ประวัติ"),
//       ),
//       body: Center(
//         child: Text("นี่คือหน้าประวัติ"),
//       ),
//     );
//   }

//   Future showdata() {
//     FirebaseFirestore.instance
//         .collection("users")
//         .where("user", isEqualTo: FirebaseAuth.instance.currentUser!.email)
//         .snapshots()
//         .listen((event) {
//       listItems = [];
//       event.docs.map((val) => listItems.add(val.data())).toList();
//     });
//     return null;
//   }
// }

// class Profile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: <Widget>[
//             Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   CircleAvatar(
//                     radius: 80,
//                     backgroundImage: AssetImage(
//                         'assets/profile_image.jpg'), // Replace with the user's profile image
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'tes tes', // Replace with the user's name
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'demo@example.com', // Replace with the user's email
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   ListTile(
//                     leading: Icon(Icons.person),
//                     title: Text(
//                         'ชื่อผู้ใช้'), // Replace with the user's phone number
//                     subtitle: Text('tes tes'),
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.phone),
//                     title: Text(
//                         'เบอรโทรศัพท์'), // Replace with the user's phone number
//                     subtitle: Text('012-345-6789'),
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.email),
//                     title: Text('อีเมล'), // Replace with the user's location
//                     subtitle: Text('tes@gmail.com'),
//                   ),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to the Edit Profile screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => EditProfileScreen()),
//                 );
//               },
//               child: Text('Edit Profile'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement the logout logic here
//                 // You can use FirebaseAuth.instance.signOut() or any other method you prefer
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => LoginPage()));
//               },
//               child: Text('ออกจากระบบ'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tes/login/login.dart';
import 'package:tes/profile/edit_profile.dart';
import 'package:tes/profile/profile.dart';

import 'package:tes/user/history.dart';
import 'package:tes/user/homescreen.dart';
import 'package:tes/user/historydetail.dart';
import 'package:tes/user/reportForm.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPageIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    History(),
    Profile(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      
      body: SafeArea(
        child: _pages[selectedPageIndex],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        selectedIndex: selectedPageIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'หน้าหลัก',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.book),
            icon: Icon(Icons.book_outlined),
            label: 'ประวัติ',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'บัญชี',
          ),
        ],
      ),
    );
  }
}
