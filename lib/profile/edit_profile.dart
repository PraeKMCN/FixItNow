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
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference profile = FirebaseFirestore.instance.collection('profile');

  String name = "";
  String email = "";
  String phonenumber = "";
  String password = "";

  bool isEditing = false;

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
      'name': nameController.text,
      'email': emailController.text,
      'phonenumber': phonenumberController.text,
      'password': passwordController.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ข้อมูลถูกอัปเดตแล้ว')));
  } catch (e) {
    print("Error updating data: $e");
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('เกิดข้อผิดพลาดในการอัปเดตข้อมูล')));
  }
}
Future<void> checkUpdatedData() async {
  User? user = _auth.currentUser;
  String uid = user!.uid;

  DocumentSnapshot profileData = await profile.doc(uid).get();
  if (profileData.exists) {
    String updatedName = profileData['name'];
    String updatedEmail = profileData['email'];
    String updatedPhonenumber = profileData['phonenumber'];
    String updatedPassword = profileData['password'];
    
    print('Updated Name: $updatedName');
    print('Updated Email: $updatedEmail');
    print('Updated Phone Number: $updatedPhonenumber');
    print('Updated Password: $updatedPassword');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไขโปรไฟล์ของคุณ'),
        backgroundColor: Color.fromARGB(255, 142, 212, 253),
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              if (isEditing) {
                nameController.text = name;
                emailController.text = email;
                phonenumberController.text = phonenumber;
                passwordController.text = password;
              }
              setState(() {
                isEditing = !isEditing;
                if (!isEditing) {
                  updateUserData();
                }
              });
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
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/profile/profilepicture.png'),
                ),
                SizedBox(height: 20),
                _buildProfileField("ชื่อ-สกุล", nameController),
                _buildProfileField("อีเมล", emailController),
                _buildProfileField("รหัสผ่าน", passwordController),
                _buildProfileField("เบอร์โทรศัพท์", phonenumberController),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: controller,
              enabled: isEditing,
            ),
          ),
        ],
      ),
    );
  }
}


