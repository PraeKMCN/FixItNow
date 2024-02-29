import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tes/admin/litsname/litsnameRepairman.dart';
import 'package:tes/admin/rewiting.dart';
import 'package:tes/admin/litsname/litsnamemember.dart';
import 'package:tes/admin/status/CompletedPage.dart';
import 'package:tes/admin/status/inprogress.dart';

class StatusDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20), // Increase vertical spacing
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'สถานะ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),
        SizedBox(height: 12), // Reduce vertical spacing
        buildStatusTile(
            context, 'กำลังดำเนินการ', 'กำลังดำเนินการ', Icons.build),
        SizedBox(height: 12), // Reduce vertical spacing
        buildStatusTile(
            context, 'คำร้องที่เสร็จสิ้นแล้ว', 'เสร็จสิ้น', Icons.check),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'รายชื่อผู้ใช้งาน',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),
        SizedBox(height: 12), // Reduce vertical spacing
        // Add approval cards here
      ],
    );
  }

  Widget buildStatusTile(BuildContext context, String statusTitle,
      String statusFirestoreField, IconData iconData) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .where('status', isEqualTo: statusFirestoreField)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        int statusCount = snapshot.data!.docs.length;

        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            onTap: () {
              _navigateToStatusPage(context, statusFirestoreField);
            },
            leading: Icon(
              iconData,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              '$statusTitle: $statusCount',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigateToStatusPage(BuildContext context, String statusFirestoreField) {
    switch (statusFirestoreField) {
      case 'กำลังดำเนินการ':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => inprogress(data: {})),
        );
        break;
      case 'เสร็จสิ้น':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Completed(data: {})),
        );
        break;
      default:
        break;
    }
  }
}

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "หน้าหลัก",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF3EBACE),
                Color(0xFF11998E),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('users').where('status', isEqualTo: 'รอดำเนินการ').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                int formCount = snapshot.data!.docs.length;

                return FormSummaryCard(
                  formTitle: 'คำร้องที่รอดำเนินการ',
                  formCount: formCount,
                );
              },
            ),
            SizedBox(height: 16),
            StatusDashboard(),
            SizedBox(height: 16),
            ApprovalCard(
              title: 'รายชื่อช่าง',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TechnicianListPage()),
                );
              },
            ),
            SizedBox(height: 16),
            ApprovalCard(
              title: 'รายชื่อผู้ใช้ทั่วไป',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserListPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ApprovalCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ApprovalCard({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
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
            color: Theme.of(context).primaryColor,
          ),
        ),
        subtitle: Text(
          'ทั้งหมด: $formCount',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        trailing: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => rewiting(data: {})),
          ),
          icon: Icon(Icons.double_arrow),
        ),
      ),
    );
  }
}
