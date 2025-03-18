import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EmptyChatScreen extends StatelessWidget {
  const EmptyChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Centers content vertically
          children: [
            Image.asset(
              "assets/images/lonely.jpg", // Make sure to add an image in assets
              width: 350,
              height: 300,
              alignment: Alignment.center,
            ),
            SizedBox(height: 20),
            Text(
              "Oops, it's lonely here! Start a chat now. 😜",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, color: const Color.fromARGB(255, 58, 57, 57)),
            ),
          ],
        ),
      ),
    );
  }
}
