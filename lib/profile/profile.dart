import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tes/login/login.dart';
import 'package:tes/profile/edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
 void _logOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.of(context).pop();
    // Redirect to the login page after successful sign-out
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  final CollectionReference profile = FirebaseFirestore.instance.collection('profile');

  String name = "";
  String email = "";
  String phonenumber = "";
  String password = "";
  String type = "";

  @override
  void initState() {
    super.initState();
    // เรียกฟังก์ชันเพื่อดึงข้อมูลผู้ใช้
    fetchUserData();
  }

  Future<void> fetchUserData() async {
  try {
    // ใช้ Firebase Authentication เพื่อรับข้อมูลของผู้ใช้ปัจจุบัน
    User? user = _auth.currentUser;
    String uid = user!.uid;

    // ดึงข้อมูลจาก Firestore
    DocumentSnapshot profileData = await profile.doc(uid).get();
    if (profileData.exists) {
      setState(() {
        name = profileData['name'];
        email = profileData['email'];
        phonenumber = profileData['phonenumber'];
        password = profileData['password'];
        type = profileData['type'];
      });
    }
  } catch (e) {
    print("เกิดข้อผิดพลาดในการดึงข้อมูล: $e");
  }
}


  void logOut() async {
    await _auth.signOut();
    Navigator.of(context).pop();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('โปรไฟล์ของคุณ'),backgroundColor: Color.fromARGB(255, 142, 212, 253),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/profile/profilepicture.png'),
            ),
            SizedBox(height: 20),
            Text(
              'ชื่อ-สกุล $name',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'อีเมล: $email',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
           
            Text(
              'เบอร์โทรศัพท์: $phonenumber',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
 Text(
              'Type: $type',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 30),
            ElevatedButton( style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 113, 222,
                                247)),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Editprofile()),
                );
              },
              child: Text('แก้ไขข้อมูลผู้ใช้'),
            ),
            SizedBox(height: 20),
           ElevatedButton(
             style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 248, 103, 103)),),
              onPressed: () {
                // Log out action
                _logOut(context);
              },
              child: Text('ออกจากระบบ'),
            ),
          ],
        ),
      ),
    );
  }
}
