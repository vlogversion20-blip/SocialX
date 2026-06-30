import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_feed_screen.dart';
import 'chat_list_screen.dart';
import 'profile_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeFeedScreen(),
    _SearchPlaceholder(),
    _AddPostPlaceholder(),
    ChatListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.peacockBlue,
        unselectedItemColor: AppColors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), activeIcon: Icon(Icons.chat_bubble), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class _SearchPlaceholder extends StatelessWidget {
  const _SearchPlaceholder();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: const Center(child: Text('Search screen jaldi aayega 🔍')),
    );
  }
}

class _AddPostPlaceholder extends StatelessWidget {
  const _AddPostPlaceholder();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Post')),
      body: const Center(child: Text('Yahan se photo/video post karenge 📸')),
    );
  }
}
