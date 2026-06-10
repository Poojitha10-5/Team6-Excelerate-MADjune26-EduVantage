import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTopBar(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle('Main group chat'),
                  const SizedBox(height: 10),
                  _buildChatGrid([
                    {
                      'name': 'MAD Flutter Batch',
                      'preview': 'Week 2 deliverable discussion...',
                      'time': '2m ago',
                      'members': '34 members',
                      'initial': 'M',
                      'color': AppColors.primaryBg,
                      'initColor': AppColors.primaryDark,
                    },
                    {
                      'name': 'Web Dev Bootcamp',
                      'preview': 'Assignment 3 answers posted',
                      'time': '1h ago',
                      'members': '28 members',
                      'initial': 'W',
                      'color': AppColors.purpleBg,
                      'initColor': AppColors.purpleAccent,
                    },
                  ]),
                  const SizedBox(height: 16),
                  _sectionTitle('Sub group chat'),
                  const SizedBox(height: 10),
                  _buildChatGrid([
                    {
                      'name': 'MAD Team 6',
                      'preview': 'Srijon: I\'ll push the login screen',
                      'time': '5m ago',
                      'members': '4 members',
                      'initial': 'T6',
                      'color': AppColors.primaryBg,
                      'initColor': AppColors.primaryDark,
                    },
                    {
                      'name': 'Design review',
                      'preview': 'Figma link shared by mentor',
                      'time': '30m ago',
                      'members': '5 members',
                      'initial': 'DR',
                      'color': AppColors.purpleBg,
                      'initColor': AppColors.purpleAccent,
                    },
                  ]),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        left: 20,
        right: 20,
        bottom: 14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'EduVantage',
            style: TextStyle(fontSize: 11, color: AppColors.primaryLight),
          ),
          SizedBox(height: 2),
          Text(
            'Chatbox',
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

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildChatGrid(List<Map<String, dynamic>> chats) {
    return Row(
      children: chats
          .map(
            (chat) => Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  right: chats.indexOf(chat) == 0 ? 8 : 0,
                  left: chats.indexOf(chat) == 1 ? 0 : 0,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border, width: 0.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: chat['color'],
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            chat['initial'],
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: chat['initColor'],
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            chat['name'],
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      chat['preview'],
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.textSecondary,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${chat['time']} · ${chat['members']}',
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
