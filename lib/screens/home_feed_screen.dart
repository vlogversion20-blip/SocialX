import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HomeFeedScreen extends StatelessWidget {
  const HomeFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> posts = [
      {'user': 'radha.bhakt', 'caption': 'Vrindavan ki shaam ✨ ॥ राधे राधे ॥', 'likes': '482'},
      {'user': 'krishna_lover', 'caption': 'Bansuri ki dhun mein kho gaye 🎶', 'likes': '910'},
      {'user': 'gokul_diaries', 'caption': 'Aaj ka prasad 🙏', 'likes': '231'},
      {'user': 'mathura_travels', 'caption': 'Yamuna kinare subah ki sair', 'likes': '654'},
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          'SocialX',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.peacockBlue,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border, color: AppColors.black), onPressed: () {}),
          IconButton(icon: const Icon(Icons.send_outlined, color: AppColors.black), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symm
