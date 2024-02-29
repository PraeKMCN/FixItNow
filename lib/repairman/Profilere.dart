
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tes/admin/profileaddmin/editpro.dart';
import 'package:tes/login/login.dart';

class Profilere extends StatefulWidget {
  const Profilere({Key? key}) : super(key: key);

  @override
  _ProfilereState createState() => _ProfilereState();
}

class _ProfilereState extends State<Profilere> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference profile = FirebaseFirestore.instance.collection('profile');

  String name = "";
  String email = "";
  String phonenumber = "";
  String password = "";
  String type = "";
  String service = "";

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      String uid = user!.uid;

      DocumentSnapshot profileData = await profile.doc(uid).get();
      if (profileData.exists) {
        setState(() {
          name = profileData['name'];
          email = profileData['email'];
          phonenumber = profileData['phonenumber'];
          password = profileData['password'];
          type = profileData['type'];
          service = profileData['service'];
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  void _logOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ประวัติการแจ้งซ่อม"),
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFAFAFA),
              Color(0xFFE0E0E0),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.02),
             CircleAvatar(
  radius: screenWidth * 0.2, // เปลี่ยนค่า radius เพื่อลดขนาด
  backgroundImage: AssetImage('assets/profile.jpg'),
),

              SizedBox(height: screenHeight * 0.02),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ชื่อ-สกุล:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      Divider(color: Colors.grey[400], height: 30),
                      Text(
                        'อีเมล:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      Divider(color: Colors.grey[400], height: 30),
                      Text(
                        'เบอร์โทรศัพท์:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        phonenumber,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      Divider(color: Colors.grey[400], height: 30),
                      Text(
                        'ประเภท:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        type,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
    Divider(color: Colors.grey[400], height: 30),
                      Text(
                        'หมวดช่าง:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        service,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF3EBACE),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3, vertical: screenHeight * 0.015),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => editproadd()),
                  );
                },
                child: Text(
                  'แก้ไขข้อมูลผู้ใช้',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF86767),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3, vertical: screenHeight * 0.015),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  _logOut(context);
                },
                child: Text(
                  'ออกจากระบบ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
