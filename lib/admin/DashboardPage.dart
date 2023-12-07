import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tes/admin/formadmin.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text('Dashboard'),
          ],
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                var formCount = snapshot.data!.size;

                return FormSummaryCard(
                  formTitle: 'จำนวนรายการแจ้งซ่อม',
                  formCount: formCount,
                );
              },
            ),
            SizedBox(height: 16),
            StatusDashboard(),
          ],
        ),
      ),
    );
  }
}

class StatusDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'สถานะ',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        SizedBox(height: 12),
        buildStatusTile(context, 'กำลังรอตรวจสอบ', 'waiting_for_review', Icons.access_time),
        buildStatusTile(context, 'กำลังดำเนินการ', 'in_progress', Icons.build),
        buildStatusTile(context, 'เสร็จสิ้น', 'completed', Icons.check),
      ],
    );
  }

  Widget buildStatusTile(BuildContext context, String statusTitle, String statusFirestoreField, IconData iconData) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').where('status', isEqualTo: statusFirestoreField).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        var statusCount = snapshot.data!.size;

        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            // onTap: () {
            //   // Handle onTap event
            //   // นำทางไปยังหน้าที่เกี่ยวข้อง
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => Historyadmin()), // เปลี่ยน RelatedPage() เป็นหน้าที่เกี่ยวข้อง
            //   );
            // },
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              leading: Icon(
                iconData,
                color: Colors.blue,
              ),
              title: Text(
                '$statusTitle: $statusCount',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class FormSummaryCard extends StatelessWidget {
  final String formTitle;
  final int formCount;

  FormSummaryCard({
    required this.formTitle,
    required this.formCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          formTitle,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        subtitle: Text(
          'ทั้งหมด: $formCount',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // ระบบนำทางไปยังหน้าที่เกี่ยวข้อง
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Historyadmin()), // เปลี่ยน RelatedPage() เป็นหน้าที่เกี่ยวข้อง
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue, // สีปุ่ม
          ),
          child: Text('ดูรายละเอียด'),
        ),
      ),
    );
  }
}
