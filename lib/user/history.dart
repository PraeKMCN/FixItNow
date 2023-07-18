import 'package:flutter/material.dart';

class ServiceHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service History'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with actual service history count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Service ${index + 1}'),
            subtitle: Text('Date: September 28, 2023'), // Replace with actual date
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle service history item tap
            },
            onLongPress: () {
              // Handle long press on service history item
            },
          );
        },
      ),
    );
  }
}
