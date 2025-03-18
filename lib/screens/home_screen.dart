import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'people_tab.dart';
import 'chat_list_screen.dart';

// Placeholder screens for the other tabs.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Profile Screen'));
}

class NoticeBoardScreen extends StatelessWidget {
  const NoticeBoardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Notice Board Screen'));
}

class LikedYouScreen extends StatelessWidget {
  const LikedYouScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Liked You Screen'));
}

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Chats Screen'));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Default to PeopleTab (index 2).
  int _currentIndex = 2;

  final List<Widget> _pages = [
    const ProfileScreen(), // Index 0.
    const NoticeBoardScreen(), // Index 1.
    PeopleTab(), // Index 2: People tab.
    const LikedYouScreen(), // Index 3.
    ChatListScreen(), // Index 4.
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}
