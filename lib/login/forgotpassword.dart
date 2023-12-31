// import 'package:flutter/material.dart';
// class ForgotPasswordPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ลืมรหัสผ่าน'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
            
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'อีเมล',
//                 prefixIcon: Icon(Icons.email),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text('ส่งอีเมลเพื่อรีเซ็ตรหัสผ่าน'),
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('กลับไปยังหน้า'),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('ล็อกอิน'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ForgotPasswordPage extends StatelessWidget {
//   // Function to handle password reset
//   void resetPassword(String email) {
//     // Here you can implement your password reset logic.
//     // For simplicity, let's just print the email for demonstration.
//     print('Password reset requested for email: $email');
//   }

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController emailController = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(  
//                         backgroundColor:
//                           Color.fromARGB(255, 113, 222,
//                                 247, // Use the same color as the AppBar
//                       ),
//         title: Text('ลืมรหัสผ่าน'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: 'อีเมล',
//                 prefixIcon: Icon(Icons.email),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//                 style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                             const Color.fromARGB(255, 113, 222,
//                                 247)), // Use the same color as the AppBar
//                       ),
//               onPressed: () {
//                 String email = emailController.text;
//                 resetPassword(email); // Call the resetPassword function
//               },
//               child: Text('ส่งอีเมลเพื่อรีเซ็ตรหัสผ่าน'),
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('กลับไปยังหน้า'),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('ล็อกอิน'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  Future<void> resetPassword(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showSnackBar(context, 'Password reset email sent to $email.');
    } catch (e) {
      showSnackBar(context, 'Failed to reset password. Please try again.');
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Builder(
          builder: (BuildContext builderContext) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String email = emailController.text;
                    resetPassword(builderContext, email);
                  },
                  child: Text('Send Reset Email'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
