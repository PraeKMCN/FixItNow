// import 'dart:collection';
// import 'package:flutter/material.dart';
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

  

//   final List<Widget> _screens = [
//     // HomeScreen(),
//     // HistoryScreen(),
//     // ProfileScreen(),
//   ];

//   void _onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//    int selectedPageIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("การจัดการขยะ"),
//       ),
//       body: SafeArea(
//         child: Container(
//           color: Colors.cyan[300],
//           child: Column(
//             children: <Widget>[
//               GridView.count(
//                 shrinkWrap: true,
//                 primary: true,
//                 crossAxisCount: 2,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                         // color: Colors.red,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25),
//                           color: Colors.white,
//                         ),
//                         child: InkWell(
//                           child: Stack(
//                             alignment: Alignment.bottomCenter,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 20.0),
//                                 child: Image.asset("assets/img.jpg"),
//                               ),
//                               Text(
//                                 "data",
//                                 style: TextStyle(fontSize: 24),
//                               )
//                             ],
//                           ),
//                         )),
//                   ),

// Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           color: Colors.white,
//         ),
//         child: InkWell(
//           child: Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20.0),
//                 child: Image.asset("assets/img.jpg"), // You can change the image source
//               ),
//               Text(
//                 "data", // You can change the text content
//                 style: TextStyle(fontSize: 24),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),

//     // Container 3 (Similar to Container 1)
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           color: Colors.white,
//         ),
//         child: InkWell(
//           child: Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20.0),
//                 child: Image.asset("assets/img.jpg"), // You can change the image source
//               ),
//               Text(
//                 "data", // You can change the text content
//                 style: TextStyle(fontSize: 24),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),

//     // Container 4 (Similar to Container 1)
//     Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           color: Colors.white,
//         ),
//         child: InkWell(
//           child: Stack(
//             alignment: Alignment.bottomCenter,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20.0),
//                 child: Image.asset("assets/img.jpg"), // You can change the image source
//               ),
//               Text(
//                 "data", // You can change the text content
//                 style: TextStyle(fontSize: 24),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
                
//                 ],

                
//               ),
//               Divider(
//                 color: Colors.grey.shade600,
//               ),

//               // Center(
//               //   child: FilledButton(
//               //     child: Text("กลับหน้าหลัก"),
//               //     onPressed: () {},
//               //   ),
//               // )


//             ],            
//           ),

//         ),
      
      
//       ),
//       [selectedPageIndex],
//       bottomNavigationBar: NavigationBar(onDestinationSelected: (int index ){
//         setState(() {
//        selectedPageIndex = index;
          
//         });
//       },
//       selectedIndex: 0,
//       destinations: const <NavigationDestination>[NavigationDestination
//       (selectedIcon: Icon(Icons.home), icon: Icon(Icons.home_outlined),
//       label: 'หน้าหลัก',),

// NavigationDestination
//       (selectedIcon: Icon(Icons.book), icon: Icon(Icons.book_online),
//       label: 'ประวัติ',),

// NavigationDestination
//       (selectedIcon: Icon(Icons.person), icon: Icon(Icons.person_outline),
//       label: 'บัญชี',),

//       ],),
// );
    
//   }
  
  
// }
