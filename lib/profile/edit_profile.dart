import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class EditProfileScreen extends StatefulWidget {
  
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
  
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController(); // Add this controller
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[

            
            CircleAvatar(
              radius: 80,
              backgroundImage:
                  AssetImage('assets/profile_image.jpg'), // Replace with the user's profile image
                  
            ),
          
          
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'ชื่อผู้ใช้'),
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'เบอร์โทรศัพท์'),
            ),
            TextFormField(
              controller: _emailController, // Use the email controller here
              decoration: InputDecoration(labelText: 'อีเมล'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Implement the logic to save the edited profile data
                String newName = _nameController.text;
                String newPhoneNumber = _phoneNumberController.text;
                String newEmail = _emailController.text; // Get email from the controller
                
                // Replace 'userId' with the actual user ID from your authentication system
                String userId = 'your_user_id_here';
                
                // Update the user's data in Firestore
                try {
                  await FirebaseFirestore.instance.collection('users').doc(userId).update({
                    'name': newName,
                    'phoneNumber': newPhoneNumber,
                    'email': newEmail, // Update the email field
                  });
                  Navigator.pop(context); // Return to the profile screen
                } catch (error) {
                  // Handle errors, e.g., display an error message to the user
                  print('Error updating data: $error');
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
