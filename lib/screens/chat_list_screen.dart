import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'chat_detail_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {'name': 'Krishna_Lover', 'msg': 'Radhe Radhe 🙏', 'time': '2m'},
      {'name': 'Gokul Diaries', 'msg': 'Aaj satsang mein milte hain', 'time': '15m'},
      {'name': 'Mathura Travels', 'msg': 'Photo bheji hai dekh lena', 'time': '1h'},
      {'name': 'Vrinda', 'msg': 'Bahut sundar tha 😍', 'time': '3h'},
      {'name': 'Hare Krishna Group', 'msg': 'Kal aarti ka time badal gaya', 'time': '1d'},
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Chats', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black)),
        actions: [
          IconButton(icon: const Icon(Icons.edit_outlined, color: AppColors.black), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundColor: AppColors.lightGold,
              child: Text(chat['name']![0], style: const TextStyle(color: AppColors.peacockBlue, fontWeight: FontWeight.bold)),
            ),
            title: Text(chat['name']!, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            subtitle: Text(chat['msg']!, style: const TextStyle(color: AppColors.grey, fontSize: 13)),
            trailing: Text(chat['time']!, style: const TextStyle(color: AppColors.grey, fontSize: 12)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatDetailScreen(name: chat['name']!)),
              );
            },
          );
        },
      ),
    );
  }
}
