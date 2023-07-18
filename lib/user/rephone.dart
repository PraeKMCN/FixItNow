import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('เปลี่ยนรหัสผ่าน'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'รหัสผ่านปัจจุบัน',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: currentPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'รหัสผ่านใหม่',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: '',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'ยืนยันรหัสผ่าน',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: '',
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('ยืนยัน'),
                  onPressed: () {
                    // Handle save button press
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
