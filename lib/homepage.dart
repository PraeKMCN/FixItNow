// import 'dart:html';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'forgotpassword.dart';
// import 'homepage1/reportForm.dart';

// class HomePage extends StatefulWidget {
//   @override
  
//   _HomePageState createState() => _HomePageState();
  
  
// }final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin {
//   int _selectedIndex = 0;
//    late TabController _tabController;

//     @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   List<Widget> _widgetOptions = <Widget>[
//     ///Text('หน้าแรก'),
    
      
//         Scaffold(
//           appBar: AppBar(title: Text('หน้าหลัก'),
//           actions: [
//             Row(
//               children: [IconButton(onPressed: (){

//               }, icon: Icon(Icons.notifications),tooltip: 'การแจ้งซ้อม',),
//               Text('การแจ้งซ่อม')],
//               mainAxisAlignment: MainAxisAlignment.end,
//             ),
//           ],
//           ),
//           body: GridView.count(
            
//             primary: false,
//             padding: const EdgeInsets.all(50),
//             crossAxisSpacing: 5,
//             mainAxisSpacing:5,
//             crossAxisCount:2,
//             children: <Widget>[
//              ButtonTheme(
//   minWidth:20.00, // กำหนดความกว้างขั้นต่ำของปุ่ม
//   height:20.00, // กำหนดความสูงของปุ่ม
//   child:
//        ElevatedButton( 
//                 onPressed: () {
                
      
//          },
//                 child: Text('ระบุปัญหา'),
//               ),
//              ),

//               ElevatedButton(
//                 onPressed: () {
//                   },
//                 child: Text('Button 2'),
//               ),

//               ElevatedButton(
//                 onPressed: () { },
//                 child: Text('Button 3'),
//               ),
//               ElevatedButton(
//                 onPressed: () { },
//                 child: Text('Button 4'),
//               ),
            
//   ]
//   ),
//   ),
 
          
        

//   // // child: new ButtonBar(
//   //  mainAxisSize: MainAxisSize.min,
//   //   buttonMinWidth: 100,
//   //   children: <Widget>[
//   //     ElevatedButton(
//   //   onPressed: () {},
//   //   child: Image.asset('ImPj.jpg'),),
//   //   ],
//   // ),),
  
    
 
  
   
     



//   Text('ประวัติ'),
  
//     Text('บัญชี'),
// ];
     
 

 

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(/////////////////
//       // ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "หน้าแรก"
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'ประวัติ',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'บัญชี',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         onTap: _onItemTapped,
//       ),
//     );
//   }

// }