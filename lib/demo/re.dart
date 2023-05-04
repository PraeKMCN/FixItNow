import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildMenuButton({required IconData icon, required String text}) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  List<Widget> _menuButtons = [    _buildMenuButton(      icon: Icons.home,      text: 'Home',    ),    _buildMenuButton(      icon: Icons.history,      text: 'History',    ),    _buildMenuButton(      icon: Icons.account_circle,      text: 'Account',    ),    _buildMenuButton(      icon: Icons.settings,      text: 'Settings',    ),  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: _menuButtons,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
        ],
      ),
    );
  }
}



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
//           ElevatedButton(
//             onPressed: () {},
//             child: Text('Button 1'),
//           ),
//           SizedBox(height: 10.0),
//           ElevatedButton(
//             onPressed: () {},
//             child: Text('Button 2'),
//           ),
//           SizedBox(height: 10.0),
//           ElevatedButton(
//             onPressed: () {},
//             child: Text('Button 3'),
//           ),
//           SizedBox(height: 10.0),
//           ElevatedButton(
//             onPressed: () {},
//             child: Text('Button 4'),
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




// import 'package:flutter/material.dart';

// class HomePages extends StatefulWidget {
//   @override
//   _HomePagesState createState() => _HomePagesState();
// }

// class _HomePagesState extends State<HomePages> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: ListView(
//         padding: EdgeInsets.symmetric(vertical: 10.0),
//         children: <Widget>[
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
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
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
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class HomePages extends StatelessWidget {
//   const HomePages({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: ListView(
//         children: [
//           SizedBox(height: 20),
//           Text(
//             'Menu',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 20),
//           ButtonNavigator(
//             icon: Icons.home,
//             label: 'Home',
//             onPressed: () {},
//           ),
//           ButtonNavigator(
//             icon: Icons.person,
//             label: 'Profile',
//             onPressed: () {},
//           ),
//           ButtonNavigator(
//             icon: Icons.message,
//             label: 'Messages',
//             onPressed: () {},
//           ),
//           ButtonNavigator(
//             icon: Icons.settings,
//             label: 'Settings',
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ButtonNavigator extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final VoidCallback onPressed;

//   const ButtonNavigator({
//     Key? key,
//     required this.icon,
//     required this.label,
//     required this.onPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: SizedBox(
//         height: 50,
//         child: ElevatedButton.icon(
//           onPressed: onPressed,
//           icon: Icon(icon),
//           label: Text(label),
//         ),
//       ),
//     );
//   }
// }

// ////////
// // TODO Implement this library.
// //  Row(
// //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //   children: [
// //     ElevatedButton(
// //       child: Text('Button 1'),
// //       onPressed: () {},
// //     ),
// //     SizedBox(width: 1,
// //     height: 10,),
// //     ElevatedButton(
// //       child: Text('Button 2'),
// //       onPressed: () {},
// //     ),
// //   ],
// // ),
// // Row(
// //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //   children: [
// //     ElevatedButton(
// //       child: Text('Button 3'),
// //       onPressed: () {},
// //     ),
// //     SizedBox(width: 1,),
    
// //     ElevatedButton(
// //       child: Text('Button 4'),
// //       onPressed: () {},
// //     ),
// //   ],
// // ),



// //   Container(
// //     margin: EdgeInsets.symmetric(vertical: 10.0),
// // child: Padding(padding: EdgeInsets.all(10),
// //      child: Column(children: <Widget>[
      
// //       Padding(padding: EdgeInsets.all(15),
// //       child: new ButtonBar(
// //       mainAxisSize: MainAxisSize.min,
// //       buttonMinWidth: 100,
// //       children: <Widget>[
// //         ElevatedButton(
// //     onPressed: () {},
// //     child: Image.asset('ImPj.jpg'),
    
// //   ),  
// //   Padding(padding: EdgeInsets.all(15),
// //   child: new ButtonBar(
// //     mainAxisSize: MainAxisSize.min,
// //     buttonMinWidth: 100,
// //     children: <Widget>[
// //       ElevatedButton(
// //     onPressed: () {},
// //     child: Image.asset('ImPj.jpg'),),
// //     ],
// //   ),),

// // Padding(padding: EdgeInsets.all(15),

//  // ElevatedButton(
//   //   onPressed: () {},
//   //   child: Text('ImPj.jpg'),),
  
//   // ElevatedButton(
//   //   onPressed: () {},
//   //   child: Text('ImPj.jpg'),),
  
//   //   ElevatedButton(
//   //   onPressed: () {},
//   //   child: Text('Button4'),),
   
   
            

// //  Container(
// //   height: 50,
// //   margin: EdgeInsets.symmetric(horizontal: 10),
// //   decoration: BoxDecoration(
// //     color: Colors.grey[800],
// //     borderRadius: BorderRadius.circular(10),
// //     border: Border.all(color: Colors.grey, width: 1),
// //   ),
// //   child: Row(
// //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //     children: [
// //       Icon(Icons.home, size: 30, color: Colors.white),
// //       Text("HOME", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
// //     ],
// //   ),
// // ),


//     // Text('ประวัติ'),
//     // Text('บัญชี'),
  