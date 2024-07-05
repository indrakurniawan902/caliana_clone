import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Text("Notification Screen"),
      ),
    );
  }
}