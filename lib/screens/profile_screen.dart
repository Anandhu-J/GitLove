import 'package:flutter/material.dart';
import 'package:git_love/screens/help_FAQ_screen.dart';
import 'dart:io';
import 'package:git_love/screens/terms_conditions.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () {
              // Handle filter action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Picture
          const SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://via.placeholder.com/150", // Replace with user's profile image URL
              ),
            ),
          ),

          // User Name
          const SizedBox(height: 10),
          const Text(
            "John Doe", // Replace with actual username
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Profile Options
          const SizedBox(height: 30),
          Column(
            children: [
              _buildProfileOption(
                icon: Icons.edit,
                text: "Edit Profile",
                arrowStatus: true,
                onTap: () {
                  // Navigate to Edit Profile
                },
              ),
              _buildProfileOption(
                icon: Icons.filter_list_rounded,
                text: "Preferences",
                arrowStatus: true,
                onTap: () {
                  // Handle Preferences
                },
              ),
              _buildProfileOption(
                icon: Icons.help_outline,
                text: "Help",
                arrowStatus: true,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HelpFAQScreen()));
                },
              ),
              _buildProfileOption(
                icon: Icons.book,
                text: "Terms & Conditions",
                arrowStatus: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermsAndConditionsScreen(),
                    ),
                  );
                },
              ),
              _buildProfileOption(
                icon: Icons.phone,
                text: "Contact Us",
                arrowStatus: false,
                onTap: () {
                  _showContactOptions(context);
                },
              ),
              _buildProfileOption(
                icon: Icons.logout,
                arrowStatus: false,
                text: "Logout",
                onTap: () {
                  _showLogoutConfirmation(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String text,
    required bool arrowStatus,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Row(
          children: [
            Icon(icon, size: 26, color: Colors.blueAccent),
            const SizedBox(width: 15),
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
            const Spacer(),
            if (arrowStatus)
              Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Whoa there! 🚀"),
          content: const Text(
              "Are you sure you want to log out? Who will miss you now? 🥺"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Nope, Stay!",
                  style: TextStyle(color: Colors.blueAccent)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _logoutAndExit(); // Call exit function
              },
              child: const Text("Yes, Bye! 👋",
                  style: TextStyle(color: Colors.redAccent)),
            ),
          ],
        );
      },
    );
  }

  void _logoutAndExit() {
    // Perform logout logic if needed

    if (Platform.isAndroid) {
      SystemNavigator.pop(); // Close the app on Android
    } else if (Platform.isIOS) {
      exit(0); // Force close the app on iOS (not recommended by Apple)
    }
  }

  void _showContactOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Makes the sheet wrap content
            children: [
              _buildContactOption(
                icon: Icons.phone,
                title: "Call us at",
                value: "+91 9876543210",
                onTap: () => launchUrl(Uri.parse("tel:+919876543210")),
              ),
              const Divider(),
              _buildContactOption(
                icon: Icons.email,
                title: "Write to us at",
                value: "support@example.com",
                onTap: () => launchUrl(Uri.parse("mailto:support@example.com")),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContactOption({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 28, color: Colors.blueAccent),
      title: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle:
          Text(value, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      onTap: onTap,
    );
  }
}
