import 'package:flutter/material.dart';





class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ลืมรหัสผ่าน'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'อีเมล',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('ส่งอีเมลเพื่อรีเซ็ตรหัสผ่าน'),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('กลับไปยังหน้า'),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('ล็อกอิน'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
