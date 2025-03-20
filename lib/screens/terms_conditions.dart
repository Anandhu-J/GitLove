import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  @override
  _TermsAndConditionsScreenState createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  '''1. Acceptance of Terms: By using this app, you agree to the following terms and conditions.\n
2. Privacy Policy: We value your privacy and will protect your personal information.\n
3. User Responsibilities: You are responsible for any content you post and must comply with all legal requirements.\n
4. Prohibited Activities: You may not use the app for illegal activities or spamming.\n
5. Limitation of Liability: The app owners are not responsible for any losses or damages caused by usage.\n
6. Changes to Terms: We reserve the right to modify these terms at any time.\n
7. Contact Us: For any concerns, contact our support team.\n
8. Governing Law: These terms are governed by applicable local laws.''',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: isAccepted,
                  onChanged: (value) {
                    setState(() {
                      isAccepted = value!;
                    });
                  },
                ),
                const Text("Accept Terms and Conditions"),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isAccepted
                  ? () {
                      Navigator.pop(context); // Close the screen on accept
                    }
                  : null,
              child: const Text("Okay"),
            ),
          ],
        ),
      ),
    );
  }
}
