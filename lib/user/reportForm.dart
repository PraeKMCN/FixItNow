import 'package:flutter/material.dart';
import 'package:tes/user/homepage.dart';

class ReportForm extends StatefulWidget {
  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // ตัวอย่างการกลับไปยังหน้าก่อนหน้านี้
            // Navigator.push(context,MaterialPageRoute(builder: ((context) => HomePage())));
          },
        ),
        title: Text('แบบฟอร์มการแจ้งปัญหา'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ชั้น/ห้อง',
                ),
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'กรุณากรอกชั้น/ห้อง';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'วัน/เดือน/ปี',
                ),
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'กรุณากรอกวัน/เดือน/ปี';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ปัญหา',
                ),
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'กรุณากรอกปัญหา';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // ตัวอย่างการส่งข้อมูลและตรวจสอบความถูกต้องของฟอร์ม
                    // if (_formKey.currentState.validate()) {
                    //   // ตัวอย่างการส่งข้อมูลไปยังเซิร์ฟเวอร์
                    //   print('ส่งข้อมูลแล้ว');
                    // }
                  },
                  child: Text('ยืนยัน'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
