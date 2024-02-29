import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Approval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('การสมัครเป็นช่าง'),
        backgroundColor: Color.fromARGB(255, 113, 222, 247),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('profile').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('เกิดข้อผิดพลาด: ${snapshot.error}'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var registration = snapshot.data!.docs[index];
              var name = registration['name'];
              var email = registration['email'];

              return CustomListItemApp(
                title: name != null ? name.toString() : 'No Name',
                description: email != null ? email.toString() : 'No Email',
              );
            },
          );
        },
      ),
    );
  }
}

class CustomListItemApp extends StatelessWidget {
  final String title;
  final String description;

  CustomListItemApp({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
    );
  }
}
