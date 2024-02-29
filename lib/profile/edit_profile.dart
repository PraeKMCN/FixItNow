// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:tes/login/login.dart';
// import 'package:tes/profile/edit_profile.dart';

// class Editprofile extends StatefulWidget {
//   const Editprofile({Key? key}) : super(key: key);

//   @override
//   _EditprofileState createState() => _EditprofileState();
// }

// class _EditprofileState extends State<Editprofile> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   void _logOut(BuildContext context) async {
//     await _auth.signOut();
//     Navigator.of(context).pop();
//     // Redirect to the login page after successful sign-out
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
//   }

//   final CollectionReference profile = FirebaseFirestore.instance.collection('profile');

//   String name = "";
//   String email = "";
//   String phonenumber = "";
//   String password = "";

//   bool isEditing = false; // To track whether the user is in edit mode

//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phonenumberController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Call the function to fetch user data
//     fetchUserData();
//   }

//   Future<void> fetchUserData() async {
//     try {
//       // Use Firebase Authentication to get the current user's data
//       User? user = _auth.currentUser;
//       String uid = user!.uid;

//       // Fetch data from Firestore
//       DocumentSnapshot profileData = await profile.doc(uid).get();
//       if (profileData.exists) {
//         setState(() {
//           name = profileData['name'];
//           email = profileData['email'];
//           phonenumber = profileData['phonenumber'];
//           password = profileData['password'];

//           // Set the initial values for the text controllers
//           nameController.text = name;
//           emailController.text = email;
//           phonenumberController.text = phonenumber;
//           passwordController.text = password;
//         });
//       }
//     } catch (e) {
//       print("Error fetching data: $e");
//     }
//   }

//   void logOut() async {
//     await _auth.signOut();
//     Navigator.of(context).pop();
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('โปรไฟล์ของคุณ'),
//         backgroundColor: Color.fromARGB(255, 142, 212, 253),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 CircleAvatar(
//                   radius: 100,
//                   backgroundImage: AssetImage('assets/profile/profilepicture.png'),
//                 ),
//                 SizedBox(height: 20),
//                 _buildProfileField("ชื่อ-สกุล", nameController),
//                 _buildProfileField("อีเมล", emailController),
//                 _buildProfileField("รหัสผ่าน", passwordController),
//                 _buildProfileField("เบอร์โทรศัพท์", phonenumberController),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: TextFormField(
//               controller: controller,
//               enabled: isEditing, // Enable or disable based on edit mode
//             ),
//           ),
//           SizedBox(width: 10),
//           isEditing
//               ? IconButton(
//                   icon: Icon(Icons.check), // Edit confirmation icon
//                   onPressed: () {
//                     // Save the updated profile data to Firestore or your storage
//                     // Update the user's data with the data in the controllers
//                     String updatedValue = controller.text;

//                     // Perform the update here
//                     // You should use Firestore or your database for this
//                     // Example:
//                     // updateUserData(updatedValue);

//                     // Disable edit mode
//                     setState(() {
//                       isEditing = false;
//                     });
//                   },
//                 )
//               : IconButton(
//                   icon: Icon(Icons.edit), // Edit icon
//                   onPressed: () {
//                     // Enable edit mode
//                     setState(() {
//                       isEditing = true;
//                     });
//                   },
//                 ),
//         ],
//       ),
//     );
//   }
// }

//////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:tes/login/login.dart';
// import 'package:tes/profile/edit_profile.dart';

// class Editprofile extends StatefulWidget {
//   const Editprofile({Key? key}) : super(key: key);

//   @override
//   _EditprofileState createState() => _EditprofileState();
// }

// class _EditprofileState extends State<Editprofile> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   void _logOut(BuildContext context) async {
//     await _auth.signOut();
//     Navigator.of(context).pop();
//     // Redirect to the login page after successful sign-out
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
//   }

//   final CollectionReference profile = FirebaseFirestore.instance.collection('profile');

//   String name = "";
//   String email = "";
//   String phonenumber = "";
//   String password = "";

//   bool isEditing = false; // To track whether the user is in edit mode

//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phonenumberController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // Call the function to fetch user data
//     fetchUserData();
//   }

//   Future<void> fetchUserData() async {
//     try {
//       // Use Firebase Authentication to get the current user's data
//       User? user = _auth.currentUser;
//       String uid = user!.uid;

//       // Fetch data from Firestore
//       DocumentSnapshot profileData = await profile.doc(uid).get();
//       if (profileData.exists) {
//         setState(() {
//           name = profileData['name'];
//           email = profileData['email'];
//           phonenumber = profileData['phonenumber'];
//           password = profileData['password'];

//           // Set the initial values for the text controllers
//           nameController.text = name;
//           emailController.text = email;
//           phonenumberController.text = phonenumber;
//           passwordController.text = password;
//         });
//       }
//     } catch (e) {
//       print("Error fetching data: $e");
//     }
//   }

//   void logOut() async {
//     await _auth.signOut();
//     Navigator.of(context).pop();
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('โปรไฟล์ของคุณ'),
//         backgroundColor: Color.fromARGB(255, 142, 212, 253),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 CircleAvatar(
//                   radius: 100,
//                   backgroundImage: AssetImage('assets/profile/profilepicture.png'),
//                 ),
//                 SizedBox(height: 20),
//                 _buildProfileField("ชื่อ-สกุล", nameController),
//                 _buildProfileField("อีเมล", emailController),
//                 _buildProfileField("รหัสผ่าน", passwordController),
//                 _buildProfileField("เบอร์โทรศัพท์", phonenumberController),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: TextFormField(
//               controller: controller,
//               enabled: isEditing, // Enable or disable based on edit mode
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

/////////////////////////////////////////////////////////

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference profile =
      FirebaseFirestore.instance.collection('profile');

  String name = "";
  String email = "";
  String phonenumber = "";
  String password = "";
  String imageUrl = ""; // เพิ่มตัวแปร imageUrl เพื่อเก็บ URL ของรูปภาพ

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

          nameController.text = name;
          emailController.text = email;
          phonenumberController.text = phonenumber;
          passwordController.text = password;
        });
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  Future<void> updateUserData() async {
    try {
      User? user = _auth.currentUser;
      String uid = user!.uid;

      await profile.doc(uid).update({
        'name': name,
        'email': email,
        'phonenumber': phonenumber,
        'password': password,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ข้อมูลถูกอัปเดตแล้ว')),
      );

      Navigator.pop(context);
    } catch (e) {
      print("Error updating data: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เกิดข้อผิดพลาดในการอัปเดตข้อมูล')),
      );
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        imageUrl = pickedImage.path; // เก็บ URL ของรูปภาพ
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ประวัติการแจ้งซ่อม", style: TextStyle(fontWeight: FontWeight.bold)),
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
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              updateUserData();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("เลือกรูปภาพ"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _pickImage(ImageSource.camera);
                              },
                              child: Text('กล้องถ่าย'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _pickImage(ImageSource.gallery);
                              },
                              child: Text('เลือกรูปจากแกลอรี่'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Stack(
                    children: [
 CircleAvatar(
  radius: 100,
  backgroundImage: imageUrl.isNotEmpty ? Image.file(File(imageUrl)).image : AssetImage('assets/profile.jpg'),
),


                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("เลือกรูปภาพ"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          _pickImage(ImageSource.camera);
                                        },
                                        child: Text('กล้องถ่าย'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          _pickImage(ImageSource.gallery);
                                        },
                                        child: Text('เลือกรูปจากแกลอรี่'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildProfileField("ชื่อ-สกุล", nameController, (value) => name = value),
                _buildProfileField("อีเมล", emailController, (value) => email = value),
                _buildProfileField("รหัสผ่าน", passwordController, (value) => password = value),
                _buildProfileField("เบอร์โทรศัพท์", phonenumberController, (value) => phonenumber = value),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, TextEditingController controller, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
