import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import 'chat_inbox_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {
        'name': 'Sarah',
        'role': 'Marketing @ Tech Co',
        'message': 'Perfect! See you there 😊',
        'time': '6:16 PM',
        'unread': 0,
        'image': AppImages.sarah,
        'online': true,
        'status': 'Active now',
      },
      {
        'name': 'Alex Rivera',
        'role': 'Product Designer',
        'message': 'See you at the 34th St pickup spot.',
        'time': 'Yesterday',
        'unread': 1,
        'image': AppImages.userAvatar,
        'online': false,
        'status': 'Active 2h ago',
      },
      {
        'name': 'Elena Rostova',
        'role': 'Architect',
        'message': 'Thanks for splitting the UberX yesterday!',
        'time': 'Oct 28',
        'unread': 0,
        'image': AppImages.sarah,
        'online': false,
        'status': 'Active yesterday',
      },
      {
        'name': 'Marcus Chen',
        'role': 'Founder @ CarbonAI',
        'message': 'Shared ride booked for Friday.',
        'time': 'Oct 25',
        'unread': 0,
        'image': AppImages.userAvatar,
        'online': true,
        'status': 'Active now',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Messages',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded, color: AppColors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        itemCount: chats.length,
        separatorBuilder: (context, index) => const Divider(color: Color(0xFF1E3243), height: 1),
        itemBuilder: (context, index) {
          final chat = chats[index];
          final unread = chat['unread'] as int;

          return InkWell(
            onTap: () {
              // Open active chat conversation matching Image 5
              Get.to(
                () => ChatInboxScreen(
                  name: chat['name'] as String,
                  image: chat['image'] as String,
                  status: chat['status'] as String,
                ),
              );
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Row(
                children: [
                  // Avatar with online status dot
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          chat['image'] as String,
                          width: 54,
                          height: 54,
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (chat['online'] == true)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              color: const Color(0xFF10B981),
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.background, width: 2),
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(width: 14),

                  // Name, Role & Message snippet
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              chat['name'] as String,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                            Text(
                              chat['time'] as String,
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                fontWeight: unread > 0 ? FontWeight.w600 : FontWeight.w400,
                                color: unread > 0 ? AppColors.primary : AppColors.grey_03,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                chat['message'] as String,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: unread > 0 ? FontWeight.w500 : FontWeight.w400,
                                  color: unread > 0 ? AppColors.white : AppColors.grey_03,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (unread > 0)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  unread.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF07141E),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
