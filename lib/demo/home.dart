// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int _currentIndex = 0;
//   final List<Widget> _pages = [
//     HomePage(),
//     HistoryPage(),
//     PersonPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (int index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'History',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Person',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
  
//   Widget build(BuildContext context) {
//    return Scaffold(
//   appBar: AppBar(
//   title: Text('หน้าหลัก'),
//   actions: [
//     Row(
//       children: [
//         IconButton(
//           onPressed: () {
//             // Handle notification icon tap here
//           },
//           icon: Icon(Icons.notifications),tooltip: 'การแจ้งซ่อม',
//         ),
//         Text('การแจ้งซ่อม'),
//       ],
//       mainAxisAlignment: MainAxisAlignment.end,
//     ),
//   ],
// ),
//   body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 10.0),
//               child: ElevatedButton(onPressed: ()
//               {}, 
//               child: Text('button1'),
//               style: ButtonStyle(
//                 fixedSize: MaterialStateProperty.all<Size>(
//                   Size(100, 50), // set button width to 200 and height to 50
//                 ),
//               ),
//               ),
//             ),
//             ElevatedButton(onPressed: (){}, child: Text('button2'),
//              style: ButtonStyle(
//     fixedSize: MaterialStateProperty.all<Size>(
//       Size(100, 50), // set button width to 200 and height to 50
//     ),
//   ),
//             ),
            
//              ],
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(onPressed: (){}, child: Text('button3'),
//                style: ButtonStyle(
//     fixedSize: MaterialStateProperty.all<Size>(
//       Size(200, 50), // set button width to 200 and height to 50
//     ),
//   ),
//               ),
//               ElevatedButton(onPressed: (){}, child: Text('button4'),
//                style: ButtonStyle(
//     fixedSize: MaterialStateProperty.all<Size>(
//       Size(100, 50), // set button width to 200 and height to 50
//     ),
//   ),
//               ),
//             ],
//           ),
          
//         ],
//       ),
//     )
//   ); 
//   }
// }

// class HistoryPage extends StatelessWidget {
//   const HistoryPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('History Page'),
//     );
//   }
// }

// class PersonPage extends StatelessWidget {
//   const PersonPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Person Page'),
//     );
//   }
// }
