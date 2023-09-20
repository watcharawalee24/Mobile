import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // ใช้ Navigator.pop() เพื่อกลับไปยังหน้าก่อนหน้า
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}