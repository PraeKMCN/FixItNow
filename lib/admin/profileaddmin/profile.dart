// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:tes/login/login.dart';
// import 'package:tes/profile/edit_profile.dart';

// class Profileaddmin extends StatefulWidget {
//   const Profileaddmin({Key? key}) : super(key: key);

//   @override
//   _ProfileaddminState createState() => _ProfileaddminState();
// }

// class _ProfileaddminState extends State<Profileaddmin> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//  void _logOut(BuildContext context) async {
//     await _auth.signOut();
//     // Navigator.of(context).pop();
//     // Redirect to the login page after successful sign-out
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
//   }

//   final CollectionReference profile = FirebaseFirestore.instance.collection('profile');

//   String name = "";
//   String email = "";
//   String phonenumber = "";
//   String password = "";
//   String type = "";

//   @override
//   void initState() {
//     super.initState();
//     // เรียกฟังก์ชันเพื่อดึงข้อมูลผู้ใช้
//     fetchUserData();
//   }

//   Future<void> fetchUserData() async {
//   try {
//     // ใช้ Firebase Authentication เพื่อรับข้อมูลของผู้ใช้ปัจจุบัน
//     User? user = _auth.currentUser;
//     String uid = user!.uid;

//     // ดึงข้อมูลจาก Firestore
//     DocumentSnapshot profileData = await profile.doc(uid).get();
//     if (profileData.exists) {
//       setState(() {
//         name = profileData['name'];
//         email = profileData['email'];
//         phonenumber = profileData['phonenumber'];
//         password = profileData['password'];
//         type = profileData['type'];
//       });
//     }
//   } catch (e) {
//     print("เกิดข้อผิดพลาดในการดึงข้อมูล: $e");
//   }
// }


//   void logOut() async {
//     await _auth.signOut();
//     Navigator.of(context).pop();
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('โปรไฟล์ของคุณ'),backgroundColor: Color.fromARGB(255, 142, 212, 253),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             CircleAvatar(
//               radius: 100,
//               backgroundImage: AssetImage('assets/profile/profilepicture.png'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'ชื่อ-สกุล $name',
//               style: TextStyle(
//                 fontSize: 23,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'อีเมล: $email',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey,
//               ),
//             ),
           
//             Text(
//               'เบอร์โทรศัพท์: $phonenumber',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey,
//               ),
//             ),
//  Text(
//               'Type: $type',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey,
//               ),
//             ),

//             SizedBox(height: 30),
//             ElevatedButton( style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                             const Color.fromARGB(255, 113, 222,
//                                 247)),),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Editprofile()),
//                 );
//               },
//               child: Text('แก้ไขข้อมูลผู้ใช้'),
//             ),
//             SizedBox(height: 20),
//            ElevatedButton(
//              style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                             Color.fromARGB(255, 248, 103, 103)),),
//               onPressed: () {
//                 // Log out action
//                 _logOut(context);
//               },
//               child: Text('ออกจากระบบ'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tes/admin/profileaddmin/editpro.dart';
import 'package:tes/login/login.dart';

class Profileaddmin extends StatefulWidget {
  const Profileaddmin({Key? key}) : super(key: key);

  @override
  _ProfileaddminState createState() => _ProfileaddminState();
}

class _ProfileaddminState extends State<Profileaddmin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference profile = FirebaseFirestore.instance.collection('profile');

  String name = "";
  String email = "";
  String phonenumber = "";
  String password = "";
  String type = "";

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
