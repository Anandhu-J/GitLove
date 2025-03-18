import 'package:flutter/material.dart';
import 'package:git_love/screens/empty_chat_screen.dart';

class Chat {
  final String name;
  final String profilePic;
  final String lastMessage;
  final DateTime time;

  Chat({
    required this.name,
    required this.profilePic,
    required this.lastMessage,
    required this.time,
  });
}

class ChatListScreen extends StatelessWidget {
  ChatListScreen({Key? key}) : super(key: key);

  // Mock Data (Replace this with API data later)
  final List<Chat> chats = [
    // Chat(
    //   name: "Sanika",
    //   profilePic: "https://picsum.photos/50/50?random=1",
    //   lastMessage: "Hey, how's it going?",
    //   time: DateTime.now().subtract(Duration(minutes: 5)),
    // ),
    // Chat(
    //   name: "Abin",
    //   profilePic: "https://picsum.photos/50/50?random=2",
    //   lastMessage: "Let's meet up tomorrow.",
    //   time: DateTime.now().subtract(Duration(hours: 1)),
    // ),
    // Chat(
    //   name: "Neha",
    //   profilePic: "https://picsum.photos/50/50?random=3",
    //   lastMessage: "Loved our last conversation!",
    //   time: DateTime.now().subtract(Duration(hours: 3)),
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        centerTitle: true,
      ),
      body: chats.isEmpty
          ? const EmptyChatScreen()
          : ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(chat.profilePic),
                  ),
                  title: Text(
                    chat.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    chat.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                    _formatTime(chat.time),
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  onTap: () {
                    // Navigate to chat details screen
                  },
                );
              },
            ),
    );
  }

  // Helper function to format chat time
  String _formatTime(DateTime time) {
    Duration diff = DateTime.now().difference(time);
    if (diff.inMinutes < 1) return "Just now";
    if (diff.inHours < 1) return "${diff.inMinutes} min ago";
    if (diff.inDays < 1) return "${diff.inHours} hrs ago";
    return "${time.day}/${time.month}/${time.year}";
  }
}
