import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class rewitingdetil extends StatefulWidget {
  final Map<String, dynamic> data;

  rewitingdetil({required this.data});

  @override
  State<rewitingdetil> createState() => _rewitingdetilState();
}

class _rewitingdetilState extends State<rewitingdetil> {
  Map<String, dynamic> firestoreData = {};
  TextEditingController technicianController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }

 void fetchDataFromFirestore() async {
  QuerySnapshot profileSnapshot = await FirebaseFirestore.instance
      .collection("profile")
      .where("service", isEqualTo: widget.data["service"])
      .get();

  if (profileSnapshot.docs.isNotEmpty) {
    DocumentSnapshot document = profileSnapshot.docs.first;
    Map<String, dynamic> profileData = document.data() as Map<String, dynamic>;
    
    // Check if the service field from profile data matches the service field from users data
    if (profileData["service"] == widget.data["service"]) {
      setState(() {
        firestoreData = profileData;
      });
    }
  }
}



  void saveDataToFirestore() async {
  Map<String, dynamic> data = {};
  data["status"] = "กำลังดำเนินการ";
  data["technician"] = technicianController.text; // Get selected technician from text field

  try {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.data["dateTime"])
        .set(data, SetOptions(merge: true)); // Use set with merge option to update or create document

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("อัปเดตข้อมูลสำเร็จ"),
      ),
    );

    Navigator.pop(context);
  } catch (e) {
    print("Error updating status: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error updating status: $e"),
      ),
    );
  }
}


  void _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
   MaterialPageRoute(
  builder: (context) => TechnicianSelectionPage(userData: widget.data),
),


    );

    if (result != null) {
      setState(() {
        technicianController.text = result['name']; // Update text field with selected technician name
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.settings, color: Colors.white),
            SizedBox(width: 10),
            Text(
              "รายละเอียดการแจ้งซ่อม",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "หมวด: ${firestoreData["service"] ?? ""}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text(
                "อาคาร: ${widget.data["Building"]}",
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                "ชั้น: ${widget.data["floor"]}, ห้อง: ${widget.data["room"]}",
                style: TextStyle(fontSize: 14),
              ),
            ),
            ListTile(
              title: Text(
                "ปัญหา: ${widget.data["problem"]}",
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                "Status: ${widget.data["status"]}",
                style: TextStyle(fontSize: 14),
              ),
            ),
            if (widget.data["url"] != null)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenImage(imageUrl: widget.data["url"]),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(widget.data["url"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 10),
            Text(
              "ว/ด/ป,เวลา: ${widget.data["dateTime"]}",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: technicianController,
                    decoration: InputDecoration(
                      labelText: 'เลือกช่าง',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _navigateAndDisplaySelection(context); // Open technician selection page
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  saveDataToFirestore();
                },
                icon: Icon(Icons.assignment_turned_in),
                label: Text("มอบหมายงาน"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF3EBACE),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
class TechnicianSelectionPage extends StatelessWidget {
  final Map<String, dynamic> userData;

  const TechnicianSelectionPage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "รายชื่อช่าง",
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('profile')
            .where('service', isEqualTo: userData['service']) // Filter by service
            .where('status', isEqualTo: 'ว่าง')
            .snapshots(),
        builder: (context, profileSnapshot) {
          if (!profileSnapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (profileSnapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'ไม่พบช่าง',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: profileSnapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var profileData = profileSnapshot.data!.docs[index].data() as Map<String, dynamic>;
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context, profileData); // Return selected technician data
                },
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                      backgroundColor: Colors.blue,
                    ),
                    title: Text(
                      profileData['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(profileData['email']),
                        SizedBox(height: 4),
                        Text(
                          ' ${profileData['service']}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          ' ${profileData['status']}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
