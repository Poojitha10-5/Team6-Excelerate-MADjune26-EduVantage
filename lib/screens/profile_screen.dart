import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../theme/app_theme.dart';
import '../models/user_model.dart';
import '../models/application_model.dart';
import '../services/auth_service.dart';
import '../services/application_service.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  final UserModel? user;

  const ProfileScreen({super.key, this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ApplicationService _applicationService = ApplicationService();
  List<ApplicationModel> _applications = [];
  bool _loadingApplications = true;
  String? _applicationsError;

  @override
  void initState() {
    super.initState();
    _loadApplications();
  }

  Future<void> _loadApplications() async {
    setState(() {
      _loadingApplications = true;
      _applicationsError = null;
    });
    try {
      final apps = await _applicationService.getMyApplications();
      if (mounted) {
        setState(() {
          _applications = apps;
          _loadingApplications = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _applicationsError = e.toString();
          _loadingApplications = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTopBar(context),
          _buildProfileCard(context),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _loadApplications,
              color: AppColors.primary,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Applied',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildAppliedSection(),
                    const SizedBox(height: 6),
                    const Text(
                      'Certificates',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildCertCard(
                      name: 'Dart Fundamentals',
                      date: 'Completed May 28, 2026',
                      assetPath: 'assets/images/dart_certificate.png',
                    ),
                    _buildCertCard(
                      name: 'Flutter UI Basics',
                      date: 'Completed June 5, 2026',
                      assetPath: 'assets/images/flutter_certificate.png',
                    ),
                    const SizedBox(height: 16),

                    // Logout button
                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          await AuthService().signOut();
                          if (context.mounted) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) => const LoginScreen()),
                              (route) => false,
                            );
                          }
                        },
                        icon: const Icon(Icons.logout,
                            size: 16, color: Colors.red),
                        label: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.red, width: 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppliedSection() {
    if (_loadingApplications) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primary,
            ),
          ),
        ),
      );
    }

    if (_applicationsError != null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red.shade200, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Couldn\'t load applications',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.red.shade700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _applicationsError!,
              style: TextStyle(fontSize: 10, color: Colors.red.shade600),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _loadApplications,
              child: Text(
                'Tap to retry',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.red.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (_applications.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border, width: 0.5),
        ),
        child: const Center(
          child: Text(
            'No applications yet — explore programs on Home.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
        ),
      );
    }

    return Column(
      children: _applications
          .map((app) => _buildAppliedCard(
                name: app.programTitle,
                session: app.programType == 'internship'
                    ? 'Internship application'
                    : 'Program application',
                due: 'Applied as ${app.applicantName}',
                progress: app.progress,
              ))
          .toList(),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        left: 20,
        right: 20,
        bottom: 36,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'EduVantage',
            style: TextStyle(
              fontSize: 11,
              color: AppColors.primaryLight,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 3),
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    final displayName = widget.user?.name ?? 'User';
    final displayEmail = widget.user?.email ?? '';
    final displayRole = widget.user?.role ?? 'Student';
    final initial = widget.user?.initial ?? 'U';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      transform: Matrix4.translationValues(0, -22, 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: AppColors.primaryBg,
            child: Text(
              initial,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryDark,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                displayName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '$displayRole · MAD Team 6',
                style: const TextStyle(fontSize: 11, color: AppColors.primary),
              ),
              const SizedBox(height: 2),
              Text(
                displayEmail,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textTertiary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppliedCard({
    required String name,
    required String session,
    required String due,
    required double progress,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary)),
                const SizedBox(height: 3),
                Text(session,
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.textSecondary)),
                const SizedBox(height: 2),
                Text(due,
                    style: const TextStyle(
                        fontSize: 10, color: AppColors.textTertiary)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          _CircularProgress(progress: progress),
        ],
      ),
    );
  }

  Widget _buildCertCard({
    required String name,
    required String date,
    required String assetPath,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => _CertificateViewer(
            name: name,
            assetPath: assetPath,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border, width: 0.5),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.primaryBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.workspace_premium_outlined,
                  size: 18, color: AppColors.primaryDark),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary)),
                  const SizedBox(height: 2),
                  Text(date,
                      style: const TextStyle(
                          fontSize: 10, color: AppColors.textTertiary)),
                ],
              ),
            ),
            // View indicator
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Earned',
                      style: TextStyle(
                          fontSize: 10,
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.w500)),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.chevron_right,
                    size: 16, color: AppColors.textTertiary),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Certificate Full-Screen Viewer ───────────────────────────────────────────

class _CertificateViewer extends StatelessWidget {
  final String name;
  final String assetPath;

  const _CertificateViewer({
    required this.name,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: InteractiveViewer(
          minScale: 0.8,
          maxScale: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                assetPath,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.broken_image_outlined,
                        color: Colors.white54, size: 48),
                    SizedBox(height: 12),
                    Text(
                      'Certificate image not found.',
                      style: TextStyle(color: Colors.white54, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Circular Progress ────────────────────────────────────────────────────────

class _CircularProgress extends StatelessWidget {
  final double progress;
  const _CircularProgress({required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: CustomPaint(
        painter: _CirclePainter(progress: progress),
        child: Center(
          child: Text(
            '${(progress * 100).round()}%',
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final double progress;
  _CirclePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 5.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = AppColors.primaryBg
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        2 * math.pi * progress,
        false,
        Paint()
          ..color = AppColors.primary
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round);
  }

  @override
  bool shouldRepaint(_CirclePainter old) => old.progress != progress;
}
