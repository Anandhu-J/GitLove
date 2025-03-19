import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/oops_error.jpg', // Make sure this image is added in your assets folder
          width: 400, // Adjust size as needed
        ),
      ),
    );
  }
}
