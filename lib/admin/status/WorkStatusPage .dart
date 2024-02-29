import 'package:flutter/material.dart';

class WorkStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สถานะการทำงาน'),
      ),
      body: ListView.builder(
        itemCount: technicians.length,
        itemBuilder: (context, index) {
          return _buildTechnicianStatus(context, technicians[index]);
        },
      ),
    );
  }

  Widget _buildTechnicianStatus(BuildContext context, Technician technician) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(technician.avatar),
        ),
        title: Text(technician.name),
        subtitle: Text('สถานะ: ${technician.status}'),
      ),
    );
  }
}

class Technician {
  final String name;
  final String status;
  final String avatar;

  Technician({
    required this.name,
    required this.status,
    required this.avatar,
  });
}

// ข้อมูลตัวอย่าง
List<Technician> technicians = [
  Technician(name: 'ช่าง A', status: 'กำลังทำงาน', avatar: 'assets/technician_a.jpg'),
  Technician(name: 'ช่าง B', status: 'ว่าง', avatar: 'assets/technician_b.jpg'),
  Technician(name: 'ช่าง C', status: 'กำลังเดินทาง', avatar: 'assets/technician_c.jpg'),
  Technician(name: 'ช่าง D', status: 'เสร็จสิ้น', avatar: 'assets/technician_d.jpg'),
  Technician(name: 'ช่าง E', status: 'กำลังรอการยืนยัน', avatar: 'assets/technician_e.jpg'),
];
