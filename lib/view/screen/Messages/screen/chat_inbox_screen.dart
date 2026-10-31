import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';

class ChatInboxScreen extends StatefulWidget {
  final String name;
  final String image;
  final String status;

  const ChatInboxScreen({
    super.key,
    this.name = 'Sarah',
    this.image = AppImages.sarah,
    this.status = 'Active now',
  });

  @override
  State<ChatInboxScreen> createState() => _ChatInboxScreenState();
}

class _ChatInboxScreenState extends State<ChatInboxScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [
    {
      'sender': 'Sarah',
      'text': "Hey! Looks like we're on the same route. Are you taking Uber too?",
      'time': '6:14 PM',
      'isMe': false,
    },
    {
      'sender': 'Me',
      'text': 'Yep! Planning to leave around 6:30. Want to meet at the pickup?',
      'time': '6:15 PM',
      'isMe': true,
    },
    {
      'sender': 'Sarah',
      'text': "Sounds good! I'll be near the main entrance.",
      'time': '6:16 PM',
      'isMe': false,
    },
    {
      'sender': 'Me',
      'text': 'Perfect! See you there 😊',
      'time': '6:16 PM',
      'isMe': true,
    },
  ];

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({
        'sender': 'Me',
        'text': text,
        'time': 'Just now',
        'isMe': true,
      });
      _messageController.clear();
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final chatName = args?['name'] ?? widget.name;
    final chatImage = args?['avatar'] ?? args?['image'] ?? widget.image;
    final chatStatus = args?['status'] ?? widget.status;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C1622),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.white, size: 18),
          onPressed: () => Get.back(),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                chatImage,
                width: 38,
                height: 38,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 38,
                  height: 38,
                  color: const Color(0xFF1E3243),
                  child: const Icon(Icons.person, color: AppColors.grey_03, size: 20),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatName,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  chatStatus,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone_outlined, color: AppColors.white, size: 20),
            onPressed: () {
              Get.snackbar(
                'Call',
                'Calling ${widget.name}...',
                snackPosition: SnackPosition.TOP,
                backgroundColor: const Color(0xFF13222E),
                colorText: AppColors.white,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.directions_car_outlined, color: AppColors.white, size: 20),
            onPressed: () {
              Get.snackbar(
                'Ride Info',
                'Williamsburg • UberX • Leaves 6:30 PM',
                snackPosition: SnackPosition.TOP,
                backgroundColor: const Color(0xFF13222E),
                colorText: AppColors.white,
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages list
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isMe = msg['isMe'] as bool;

                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.76,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isMe
                          ? const Color(0xFF0D685E) // Mint dark bubble matching Image 5
                          : const Color(0xFF12202C), // Slate dark bubble matching Image 5
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(18),
                        topRight: const Radius.circular(18),
                        bottomLeft: isMe ? const Radius.circular(18) : const Radius.circular(4),
                        bottomRight: isMe ? const Radius.circular(4) : const Radius.circular(18),
                      ),
                      border: Border.all(
                        color: isMe ? const Color(0xFF147D72) : const Color(0xFF1C2F3F),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Text(
                          msg['text'] as String,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                            height: 1.35,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          msg['time'] as String,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: isMe ? const Color(0xFF8DE0D5) : AppColors.greyLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Bottom Input Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: const BoxDecoration(
              color: Color(0xFF0C1622),
              border: Border(top: BorderSide(color: Color(0xFF1B2F3F), width: 1)),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  // Text input container
                  Expanded(
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF111E2A),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0xFF1E3243), width: 1),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _messageController,
                          onSubmitted: (_) => _sendMessage(),
                          style: GoogleFonts.poppins(color: AppColors.white, fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            hintStyle: GoogleFonts.poppins(color: AppColors.greyLight, fontSize: 14),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Send Button
                  GestureDetector(
                    onTap: _sendMessage,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.send_rounded,
                          color: Color(0xFF07141E),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

