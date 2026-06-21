import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/application_service.dart';
import 'home_screen.dart';

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
          onPressed: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => _ApplyModal(item: item),
          ),
          child: const Text('Apply Now'),
        ),
      ),
    );
  }
}

class _ApplyModal extends StatefulWidget {
  final Map<String, dynamic> item;

  const _ApplyModal({required this.item});

  @override
  State<_ApplyModal> createState() => _ApplyModalState();
}

class _ApplyModalState extends State<_ApplyModal> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _applicationService = ApplicationService();

  // 'form' | 'loading' | 'success'
  String _state = 'form';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _state = 'loading');

    final error = await _applicationService.submitApplication(
      programTitle: widget.item['title'] ?? '',
      programType: widget.item['type'] ?? 'program',
      name: _nameController.text,
      email: _emailController.text,
    );

    if (!mounted) return;

    if (error != null) {
      setState(() => _state = 'form');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error),
          backgroundColor: Colors.red.shade600,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      setState(() => _state = 'success');
    }
  }

  void _goToProfile() {
    Navigator.of(context).pop(); // close the modal
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const HomeScreen(initialIndex: 1)),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _state != 'loading',
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: _state == 'loading'
                ? _buildLoader()
                : _state == 'success'
                    ? _buildSuccess()
                    : _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Apply now',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.item['title'] ?? '',
            style:
                const TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 20),

          // Name
          _label('Name'),
          const SizedBox(height: 5),
          TextFormField(
            controller: _nameController,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'Your name',
              prefixIcon: Icon(Icons.person_outline,
                  size: 18, color: AppColors.textTertiary),
            ),
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Name is required' : null,
          ),
          const SizedBox(height: 14),

          // Email
          _label('Email'),
          const SizedBox(height: 5),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _submit(),
            decoration: const InputDecoration(
              hintText: 'your@email.com',
              prefixIcon: Icon(Icons.email_outlined,
                  size: 18, color: AppColors.textTertiary),
            ),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'Email is required';
              if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(v.trim())) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 22),

          // Submit
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: _submit,
              child: const Text('Submit Application'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoader() {
    return const SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: AppColors.primary,
            strokeWidth: 3,
          ),
          SizedBox(height: 20),
          Text(
            'Submitting your application...',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccess() {
    return SizedBox(
      height: 240,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: AppColors.primaryBg,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              color: AppColors.primary,
              size: 36,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Applied successfully!',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Check your profile to track progress.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: 180,
            height: 42,
            child: ElevatedButton(
              onPressed: _goToProfile,
              child: const Text('Go to Profile'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _label(String text) => Text(
        text,
        style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
      );
}
