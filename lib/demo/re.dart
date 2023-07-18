// import 'package:flutter/material.dart';

// class HomePages extends StatefulWidget {
//   @override
//   _HomePagesState createState() => _HomePagesState();
// }

// class _HomePagesState extends State<HomePages> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     Home(),
//     History(),
//     Account(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: _pages,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
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
//             icon: Icon(Icons.account_circle),
//             label: 'Account',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: ListView(
//         padding: EdgeInsets.symmetric(vertical: 20.0),
//         children: [
          
//           Padding(
            
//             padding: const EdgeInsets.all(8.0),
            
//             child: ElevatedButton(
              
//               onPressed: () {},
//               child: Text('ช่างปะปา'),
//             ),
//           ),
//           SizedBox(height: 10.0,width: 10,),

//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () {},
//               child: Text('Button 2'),
//             ),
//           ),
//           SizedBox(height: 10.0),
          
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () {},
//               child: Text('Button 3'),
//             ),
//           ),
//           SizedBox(height: 10.0),

//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: () {},
//               child: Text('Button 4'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class History extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('History'),
//       ),
//       body: Center(
//         child: Text('History Page'),
//       ),
//     );
//   }
// }

// class Account extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Account'),
//       ),
//       body: Center(
//         child: Text('Account Page'),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),centerTitle: true,
      ),
body :Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Container(
      
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),    
      child: Row(
        
        children: [
       Expanded(child: Text('บริการแจ้งซ่อม',
      textAlign: TextAlign.left, ),
      ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
            tooltip: 'การแจ้งซ่อม',
          ),
          Text('การแจ้งซ่อม',
          textAlign: TextAlign.right,),      
  ],
  
  )
  ),
  
  
  

//     Expanded(
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ElevatedButton(
//           onPressed: () {},
//           style: ButtonStyle(
//             minimumSize: MaterialStateProperty.all(Size(500, 300)), // กำหนดขนาดของปุ่ม
//             padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)), // กำหนด Padding ของปุ่ม
//           ),
//           child: Text('ช่างประปา'),
//         ),
//       ),
//     ],
//   ),
// ),

           Row(
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(
                  child: Text('ช่างปะปา'),
                  onPressed: () {
                    // TODO: Navigate to Menu 1 page
                  },style:ElevatedButton.styleFrom(fixedSize: Size(450, 60),shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15), // กำหนดรูปทรงของปุ่ม
                   ),)
                         ),
               ),
             ],
           ),
          SizedBox(height: 10.0),

          Row(
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(
                  child: Text('ช่างแอร์'),
                  onPressed: () {
                    // TODO: Navigate to Menu 1 page
                  },style:ElevatedButton.styleFrom(fixedSize: Size(450, 60),shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15), // กำหนดรูปทรงของปุ่ม
                   ),)
                         ),
               ),
             ],
           ),
          SizedBox(height: 10.0),

          Row(
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(
                  child: Text('ช่างคอมพิวเตอร์'),
                  onPressed: () {
                    // TODO: Navigate to Menu 1 page
                  },style:ElevatedButton.styleFrom(fixedSize: Size(450, 60),shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15), // กำหนดรูปทรงของปุ่ม
                   ),)
                         ),
               ),
             ],
           ),
          SizedBox(height: 10.0),

          Row(
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(
                  child: Text('ช่างไฟฟ้า'),
                  onPressed: () {
                    // TODO: Navigate to Menu 1 page
                  },style:ElevatedButton.styleFrom(fixedSize: Size(450, 60),shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15), // กำหนดรูปทรงของปุ่ม
                   ),)
                         ),
               ),
             ],
           ),
          SizedBox(height: 10.0),

// Expanded(
//   child: SizedBox(
//     height: 200,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ElevatedButton(
//             onPressed: () {},
//             style: ButtonStyle(
//               minimumSize: MaterialStateProperty.all(Size(500, 250)), // กำหนดขนาดของปุ่ม
//               padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)), // กำหนด Padding ของปุ่ม
//             ),
//             child: Text('ช่างแอร์'),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),

// Expanded(
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ElevatedButton(
//           onPressed: () {},
//           style: ButtonStyle(
//             minimumSize: MaterialStateProperty.all(Size(500, 250)), // กำหนดขนาดของปุ่ม
//             padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)), // กำหนด Padding ของปุ่ม
//           ),
//           child: Text('ช่าวคอมพิวเตอร์'),
//         ),
//       ),
//     ],
//   ),
// ),

// Expanded(
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ElevatedButton(
//           onPressed: () {},
//           style: ButtonStyle(
//             minimumSize: MaterialStateProperty.all(Size(500, 250)), // กำหนดขนาดของปุ่ม
//             padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)), //
//           ), child: Text('ช่างไฟฟ้า'), 
//            )
//            )
//   ],
// ),
//   ),
 
   ]),


//       body:
// ListView(
//         padding: EdgeInsets.symmetric(vertical: 10.0),
//         children: <Widget>[
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child:   Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text('บริการแจ้งซ่อม'),
//      IconButton(onPressed: (){}, icon: Icon(Icons.notifications),
//      ),
//     ],
//   ),
// ), 
//            ElevatedButton(
//             child: Text('Menu 1'),
//             onPressed: () {
//               // TODO: Navigate to Menu 1 page
//             },style:ElevatedButton.styleFrom(fixedSize: Size(200, 60),shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15), // กำหนดรูปทรงของปุ่ม
//     ),)
//           ),
//           SizedBox(height: 10.0),
//           ElevatedButton(
//             child: Text('Menu 2'),
//             onPressed: () {
//               // TODO: Navigate to Menu 2 page
//             },style:ElevatedButton.styleFrom(fixedSize: Size(200, 60),shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15), // กำหนดรูปทรงของปุ่ม
//     ),)
//           ),
//           SizedBox(height: 10.0),
//           ElevatedButton(
//             child: Text('Menu 3'),
//             onPressed: () {
//               // TODO: Navigate to Menu 3 page
//             },style:ElevatedButton.styleFrom(fixedSize: Size(200, 60),shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15), // กำหนดรูปทรงของปุ่ม
//     ),)
//           ),
//           SizedBox(height: 10.0),
//           ElevatedButton(
//             child: Text('Menu 4'),
//             onPressed: () {
//               // TODO: Navigate to Menu 4 page
//             },style:ElevatedButton.styleFrom(fixedSize: Size(200, 60),shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15), // กำหนดรูปทรงของปุ่ม
//     ),)
//           ),
//         ],
//       ),


      bottomNavigationBar: BottomNavigationBar(
       selectedItemColor: Colors.blueAccent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Seting',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

