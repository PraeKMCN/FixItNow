import 'package:flutter/material.dart';


class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _isRepairNotification = true;

  void _toggleNotification() {
    setState(() {
      _isRepairNotification = !_isRepairNotification;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("การแจ้งซ่อม"),
        centerTitle: true,
        
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Spacer(), 
              InkWell(
                onTap: () {
                  setState(() {
                    _isRepairNotification = true;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "แจ้งซ่อม",
                    style: TextStyle(
                      color: _isRepairNotification
                          ? Colors.white
                          : Colors.grey[400],
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    _isRepairNotification = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "ประวัติการแจ้งซ่อม",
                    style: TextStyle(
                      color: !_isRepairNotification
                          ? Colors.white
                          : Colors.grey[400],
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
               Spacer(), 
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              child: ListTile(
                leading: Icon(
                  _isRepairNotification ? Icons.build : Icons.check_circle_outline,
                  color: _isRepairNotification ? Colors.red : Colors.green,
                ),
                title: Text(_isRepairNotification ? "การแจ้งซ่อม #" : "บริการเรียบร้อย #"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_isRepairNotification ? "วันที่แจ้งซ่อม: 01/04/2023" : "วันที่บริการ: 05/04/2023"),
                SizedBox(height: 4.0),
                Text(_isRepairNotification ? "สถานะ: กำลังดำเนินการ" : "สถานะ: เรียบร้อยแล้ว"),
              ],
            ),
          ),
        ),
      );
    },
  ),
);
  }}