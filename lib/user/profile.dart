import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title: Text('Profile'),
        
      ),
      body: Column(
        children: [
          Container(
            // Header section
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile_picture.jpg'),
                ),
                SizedBox(height: 16),
                Text(
                  'ชื่อ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          // Menu section
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('ชื่อผู้ใช้'),
                  
                  onTap: () {
                    // Handle profile menu item tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.mobile_friendly),
                  title: Text('โทรศัพท์'),
                  onTap: () {
                    // Handle friends menu item tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('อีเมล'),
                  onTap: () {
                    // Handle settings menu item tap
                  },
                ),

                ListTile(
                  leading: Icon(Icons.key),
                  title: Text('เปลี่ยนรหัสผ่าน'),
                  onTap: () {
                    // Handle logout menu item tap
                  },
                ),

                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('ออกจากระบบ'),
                  onTap: () {
                    // Handle logout menu item tap
                  },
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
