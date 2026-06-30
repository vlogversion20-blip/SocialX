import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('radha_bhakt99',
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: AppColors.black),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [AppColors.gold, AppColors.peacockBlue]),
                ),
                child: const CircleAvatar(
                  radius: 42,
                  backgroundColor: AppColors.lightGold,
                  child: Icon(Icons.person, size: 42, color: AppColors.peacockBlue),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _StatColumn(count: '128', label: 'Posts'),
                    _StatColumn(count: '5.2K', label: 'Followers'),
                    _StatColumn(count: '312', label: 'Following'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Radha Sharma', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 4),
          const Text('॥ राधे राधे ॥ 🦚\nVrindavan se pyaar 💛\nPhotography | Travel | Bhakti',
              style: TextStyle(fontSize: 13, height: 1.4)),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.grey),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  child: const Text('Edit Profile', style: TextStyle(color: AppColors.black)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.grey),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  child: const Text('Share Profile', style: TextStyle(color: AppColors.black)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: index % 2 == 0
                    ? AppColors.peacockBlue.withOpacity(0.85)
                    : AppColors.gold.withOpacity(0.85),
                child: const Icon(Icons.image, color: Colors.white24),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String count;
  final String label;
  const _StatColumn({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: const TextStyle(fontSize: 12, color: AppColors.grey)),
      ],
    );
  }
}
