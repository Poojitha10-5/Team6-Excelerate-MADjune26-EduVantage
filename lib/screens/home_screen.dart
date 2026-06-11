import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';
import 'program_details_screen.dart';
import 'profile_screen.dart';
import 'learn_screen.dart';
import 'messages_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  final UserService _userService = UserService();
  UserModel? _user;

  final List<Map<String, dynamic>> _programs = [
    {
      'title': 'Mobile App Dev with Flutter',
      'desc':
          'Build cross-platform apps using Flutter & Dart. Covers UI design, state management, and Firebase integration.',
      'tag': 'Flutter',
      'duration': '4 weeks',
      'tagColor': AppColors.primaryBg,
      'tagTextColor': AppColors.primaryDark,
      'type': 'program',
    },
    {
      'title': 'Web Development Bootcamp',
      'desc':
          'Intensive program covering HTML, CSS, React, and Node.js with real-world project experience.',
      'tag': 'Web Dev',
      'duration': '6 weeks',
      'tagColor': AppColors.primaryBg,
      'tagTextColor': AppColors.primaryDark,
      'type': 'program',
    },
  ];

  final List<Map<String, dynamic>> _internships = [
    {
      'title': 'Flutter Developer Intern',
      'desc':
          'Work with a product team building real features in a live Flutter codebase. Remote-friendly.',
      'tag': 'Open',
      'duration': 'Remote · 8 weeks',
      'tagColor': AppColors.purpleBg,
      'tagTextColor': AppColors.purpleAccent,
      'type': 'internship',
    },
    {
      'title': 'UI/UX Design Intern',
      'desc':
          'Design mobile interfaces, conduct user research, and create Figma prototypes for student-facing apps.',
      'tag': 'Open',
      'duration': 'Hybrid · 6 weeks',
      'tagColor': AppColors.purpleBg,
      'tagTextColor': AppColors.purpleAccent,
      'type': 'internship',
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final user = await _userService.getCurrentUser();
    if (mounted) setState(() => _user = user);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _navigateToDetails(Map<String, dynamic> item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProgramDetailsScreen(item: item)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Pass user down to profile screen
    final screens = [
      const SizedBox(), // Home rendered inline
      ProfileScreen(user: _user),
      const LearnScreen(),
      const MessagesScreen(),
    ];

    return Scaffold(
      body: _currentIndex == 0 ? _buildHome() : screens[_currentIndex],
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHome() {
    return Column(
      children: [
        _buildTopBar(),
        _buildSearchBar(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader('Programs', () {}),
                ..._programs.map((p) => _buildProgramCard(p)),
                _buildSectionHeader('Internships', () {}),
                ..._internships.map((p) => _buildProgramCard(p)),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopBar() {
    final firstName = _user?.firstName ?? '';
    final initial = _user?.initial ?? '';

    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        left: 20,
        right: 20,
        bottom: 14,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Edu',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Vantage',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                firstName.isEmpty
                    ? 'Welcome 👋'
                    : 'Good morning, $firstName 👋',
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.primaryLight,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => setState(() => _currentIndex = 1),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.primaryDark,
              child: Text(
                initial,
                style: const TextStyle(
                  color: AppColors.primaryLight,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Icon(Icons.search, size: 18, color: AppColors.textTertiary),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              style: const TextStyle(fontSize: 13),
              decoration: const InputDecoration(
                hintText: 'Search programs, internships...',
                hintStyle:
                    TextStyle(fontSize: 13, color: AppColors.textTertiary),
                border: InputBorder.none,
                filled: false,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onSeeAll) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: const Text(
              'See all',
              style: TextStyle(fontSize: 12, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgramCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () => _navigateToDetails(item),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: item['tagColor'],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                item['tag'],
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: item['tagTextColor'],
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              item['title'],
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item['desc'],
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        size: 12, color: AppColors.textTertiary),
                    const SizedBox(width: 4),
                    Text(
                      item['duration'],
                      style: const TextStyle(
                          fontSize: 11, color: AppColors.textTertiary),
                    ),
                  ],
                ),
                const Icon(Icons.arrow_forward,
                    size: 14, color: AppColors.primary),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border, width: 0.5)),
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            activeIcon: Icon(Icons.menu_book),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}
