import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProfilesEndScreen extends StatelessWidget {
  const ProfilesEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Centers content vertically
          children: [
            Image.asset(
              'assets/images/oops_funny.jpg',
              width: 150, // Adjust size as needed
            ),
            const SizedBox(height: 20), // Space between image and text
            const Text(
              'Oops',
              style: TextStyle(
                fontSize: 36, // Big font size
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'End of profiles, Get a Life Bruhhh!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16, // Smaller subtitle text
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
