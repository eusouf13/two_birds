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
    this.name = 'Jasmine, 27',
    this.image = AppImages.sarah,
    this.status = 'Online',
  });

  @override
  State<ChatInboxScreen> createState() => _ChatInboxScreenState();
}

class _ChatInboxScreenState extends State<ChatInboxScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [
    {
      'type': 'text',
      'sender': 'Jasmine',
      'text':
          "Hey Alex! Looks like we're both heading to Arlington today at 6:30?",
      'time': '6:12 PM',
      'isMe': false,
    },
    {
      'type': 'text',
      'sender': 'Me',
      'text': "Yes! Want to ride together? I'm leaving from Dupont.",
      'time': '6:14 PM',
      'isMe': true,
    },
    {
      'type': 'text',
      'sender': 'Jasmine',
      'text':
          "Perfect. I'm a few blocks away. Want to meet at the main entrance?",
      'time': '6:16 PM',
      'isMe': false,
    },
    {
      'type': 'location',
      'title': 'Dupont Circle',
      'subtitle': 'Washington, DC',
      'distance': '~0.2 mi',
      'isMe': false,
    },
  ];

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({
        'type': 'text',
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

  Widget _buildLocationCard(Map<String, dynamic> item) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 14),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.78,
        ),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF0C1B28),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primary,
            width: 1.4,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.12),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            // Cyan Pin Icon
            const Icon(
              Icons.location_on,
              color: AppColors.primary,
              size: 34,
            ),
            const SizedBox(width: 12),

            // Location details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item['title'] as String,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item['subtitle'] as String,
                    style: GoogleFonts.poppins(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey_03,
                    ),
                  ),
                ],
              ),
            ),
            if (item['distance'] != null)
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  item['distance'] as String,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryLight,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextMessage(Map<String, dynamic> msg) {
    final isMe = msg['isMe'] as bool;
    final text = msg['text'] as String;
    final time = msg['time'] as String;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.76,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isMe
                  ? AppColors.primary // Vibrant cyan for outgoing
                  : const Color(0xFF1E2E3E), // Dark slate blue for incoming
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: isMe ? FontWeight.w500 : FontWeight.w400,
                color: isMe ? const Color(0xFF042F2C) : AppColors.white,
                height: 1.35,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.only(
              left: isMe ? 0 : 4,
              right: isMe ? 4 : 0,
            ),
            child: Text(
              time,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppColors.grey_03,
              ),
            ),
          ),
        ],
      ),
    );
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
        backgroundColor: const Color(0xFF09141E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: AppColors.white, size: 18),
          onPressed: () => Get.back(),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.6),
                  width: 1.5,
                ),
              ),
              child: CircleAvatar(
                radius: 19,
                backgroundImage: AssetImage(chatImage),
                onBackgroundImageError: (_, __) {},
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatName,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  chatStatus,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
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
            icon: const Icon(Icons.phone_outlined,
                color: AppColors.white, size: 22),
            onPressed: () {
              Get.snackbar(
                'Audio Call',
                'Connecting call to $chatName...',
                snackPosition: SnackPosition.TOP,
                backgroundColor: const Color(0xFF13222E),
                colorText: AppColors.white,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert,
                color: AppColors.white, size: 22),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages list
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final item = _messages[index];
                if (item['type'] == 'location') {
                  return _buildLocationCard(item);
                }
                return _buildTextMessage(item);
              },
            ),
          ),

          // Bottom Input Bar (Screenshot 2 design)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: const BoxDecoration(
              color: Color(0xFF09141E),
              border:
                  Border(top: BorderSide(color: Color(0xFF162534), width: 1)),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  // Circular "+" button with cyan border
                  GestureDetector(
                    onTap: () {
                      Get.snackbar(
                        'Attachments',
                        'Share location or ride route',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: const Color(0xFF13222E),
                        colorText: AppColors.white,
                      );
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 1.8),
                        color: Colors.transparent,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add_rounded,
                          color: AppColors.primary,
                          size: 26,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Capsule Input Field with integrated send arrow inside
                  Expanded(
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF11202D),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                            color: const Color(0xFF1B2E3E), width: 1),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _messageController,
                              onSubmitted: (_) => _sendMessage(),
                              style: GoogleFonts.poppins(
                                  color: AppColors.white, fontSize: 14),
                              decoration: InputDecoration(
                                hintText: 'Type a message...',
                                hintStyle: GoogleFonts.poppins(
                                  color: AppColors.grey_03,
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _sendMessage,
                            child: const Icon(
                              Icons.send_rounded,
                              color: AppColors.primary,
                              size: 22,
                            ),
                          ),
                        ],
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
