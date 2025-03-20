import 'package:flutter/material.dart';

class HelpFAQScreen extends StatefulWidget {
  @override
  _HelpFAQScreenState createState() => _HelpFAQScreenState();
}

class _HelpFAQScreenState extends State<HelpFAQScreen> {
  List<Map<String, dynamic>> faqs = [
    {
      "question": "How do I reset my password?",
      "answer":
          "To reset your password, go to settings and tap on 'Change Password'.",
      "isExpanded": false
    },
    {
      "question": "How can I contact customer support?",
      "answer":
          "You can contact customer support via email at support@example.com.",
      "isExpanded": false
    },
    {
      "question": "What should I do if the app crashes?",
      "answer":
          "Try clearing the cache or reinstalling the app to fix crash issues.",
      "isExpanded": false
    },
  ];

  void toggleExpansion(int index) {
    setState(() {
      faqs[index]['isExpanded'] = !faqs[index]['isExpanded'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Help & FAQ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int index = 0; index < faqs.length; index++) ...[
                InkWell(
                  onTap: () => toggleExpansion(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Text(
                          "${index + 1}. ", // Numbering
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            faqs[index]["question"],
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        Icon(
                          faqs[index]["isExpanded"]
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 22,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                if (faqs[index]["isExpanded"])
                  Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 10),
                    child: Text(
                      faqs[index]["answer"],
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
                Divider(
                    color: Colors.grey.shade300,
                    thickness: 1), // Aesthetic divider
              ],
            ],
          ),
        ),
      ),
    );
  }
}
