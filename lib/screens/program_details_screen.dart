import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'profile_screen.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const ProgramDetailsScreen({super.key, required this.item});

  static const List<Map<String, String>> _weeks = [
    {
      'week': '1',
      'title': 'Setup & Dart fundamentals',
      'desc': 'Flutter SDK, VS Code setup, Dart syntax basics',
    },
    {
      'week': '2',
      'title': 'UI prototype — 4 screens',
      'desc': 'Widgets, navigation, stateful vs stateless',
    },
    {
      'week': '3',
      'title': 'Firebase integration',
      'desc': 'Auth, Firestore, real-time data binding',
    },
    {
      'week': '4',
      'title': 'Final build & submission',
      'desc': 'Polish, testing, GitHub README, demo video',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHero(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildStatsRow(),
                  const SizedBox(height: 14),
                  _buildAboutCard(),
                  const SizedBox(height: 12),
                  _buildWeekCard(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          _buildApplyBar(context),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 10,
        left: 16,
        right: 16,
        bottom: 24,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.arrow_back, color: AppColors.primaryLight, size: 16),
                SizedBox(width: 6),
                Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primaryLight,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          // Tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              item['tag'] ?? 'Flutter',
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.primaryLight,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            item['title'] ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              height: 1.3,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 10),
          // Meta row
          Row(
            children: [
              _heroMeta(Icons.access_time, item['duration'] ?? '4 weeks'),
              const SizedBox(width: 16),
              _heroMeta(Icons.people_outline, '120 enrolled'),
              const SizedBox(width: 16),
              _heroMeta(Icons.star_border, '4.8'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heroMeta(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 12, color: AppColors.primaryLight),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.primaryLight,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(child: _statBox('4', 'Weeks')),
        const SizedBox(width: 12),
        Expanded(child: _statBox('Free', 'Cost')),
      ],
    );
  }

  Widget _statBox(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: AppColors.textTertiary),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ABOUT',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            item['desc'] ??
                'Build cross-platform mobile apps using Flutter and Dart. '
                    'Covers everything from environment setup to deploying a full-featured '
                    'app with Firebase. Designed for students with basic programming knowledge.',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
              height: 1.7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'WEEK BY WEEK',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 12),
          ..._weeks.asMap().entries.map((entry) {
            final i = entry.key;
            final w = entry.value;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryBg,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          w['week']!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              w['title']!,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              w['desc']!,
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (i < _weeks.length - 1)
                  const Divider(color: AppColors.border, height: 1),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildApplyBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border, width: 0.5)),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Applied successfully! Check your profile.'),
                backgroundColor: AppColors.primary,
              ),
            );
            Future.delayed(const Duration(seconds: 1), () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
                (route) => false,
              );
            });
          },
          child: const Text('Apply Now'),
        ),
      ),
    );
  }
}
