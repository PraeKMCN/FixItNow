import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../forgotpassword.dart';
// import '../homepage1/reportForm.dart';

class HomePage extends StatefulWidget {
  @override
  
  _HomePageState createState() => _HomePageState();
  
  
}final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
   late TabController _tabController;

    @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  List<Widget> _widgetOptions = <Widget>[
    ///Text('หน้าแรก'),
    
      Scaffold(
  appBar: AppBar(
    title: Text('หน้าหลัก'),
    centerTitle: true,
    actions: [
    ],
  ),
  body: 
  Column(
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
  
  
  ])),
  
  
  
  

    Expanded(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(500, 250)), // กำหนดขนาดของปุ่ม
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)), // กำหนด Padding ของปุ่ม
          ),
          child: Text('ช่างประปา'),
        ),
      ),
    ],
  ),
),

Expanded(
  child: SizedBox(
    height: 200,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(500, 250)), // กำหนดขนาดของปุ่ม
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)), // กำหนด Padding ของปุ่ม
            ),
            child: Text('ช่างแอร์'),
          ),
        ),
      ],
    ),
  ),
),

Expanded(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(500, 250)), // กำหนดขนาดของปุ่ม
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)), // กำหนด Padding ของปุ่ม
          ),
          child: Text('ช่าวคอมพิวเตอร์'),
        ),
      ),
    ],
  ),
),

Expanded(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(500, 250)), // กำหนดขนาดของปุ่ม
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)), //
          ), child: Text('ช่างไฟฟ้า'), 
           )
           )
  ],
),
  ),
 

  
   ]
   ) 
  
   ), 

   

  Scaffold(
      appBar: AppBar(
    title: Text('ประวัติ'),
    centerTitle: true,
    actions: [
    ],
  ),
  
  body: Column(
  
  children: [
    
    Expanded(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(500, 250)), // กำหนดขนาดของปุ่ม
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)), // กำหนด Padding ของปุ่ม
          ),
          child: Text('ช่างประปา'),
        ),
      ),
    ],
  ),
),

Expanded(
  child: SizedBox(
    height: 200,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(500, 250)), // กำหนดขนาดของปุ่ม
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)), // กำหนด Padding ของปุ่ม
            ),
            child: Text('ช่างแอร์'),
          ),
        ),
      ],
    ),
  ),
),

Expanded(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(500, 250)), // กำหนดขนาดของปุ่ม
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)), // กำหนด Padding ของปุ่ม
          ),
          child: Text('ช่าวคอมพิวเตอร์'),
        ),
      ),
    ],
  ),
),

Expanded(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(500, 250)), // กำหนดขนาดของปุ่ม
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 16)), //
          ), child: Text('ช่างไฟฟ้า'), 
           )
           )
  ],
),
  ),
 

  
   ]
   ) ,
  ),
    
   
  //  Text('ประวัติ'),
   
    Text('บัญชี'),

    Text('data')
   ];
 
   
 

 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(/////////////////
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "หน้าแรก"


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'ประวัติ',
          ),

         

          BottomNavigationBarItem(
             
            icon: Icon(Icons.person),
            label: 'บัญชี', 
          ),


        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

}