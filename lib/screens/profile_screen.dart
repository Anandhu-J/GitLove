import 'package:flutter/material.dart';

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
                onTap: () {
                  // Navigate to Edit Profile
                },
              ),
              _buildProfileOption(
                icon: Icons.filter_list_rounded,
                text: "Preferences",
                onTap: () {
                  // Handle Preferences
                },
              ),
              _buildProfileOption(
                icon: Icons.help_outline,
                text: "Help",
                onTap: () {
                  // Handle Help
                },
              ),
              _buildProfileOption(
                icon: Icons.phone,
                text: "Contact Us",
                onTap: () {
                  // Handle Contact Us
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
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
