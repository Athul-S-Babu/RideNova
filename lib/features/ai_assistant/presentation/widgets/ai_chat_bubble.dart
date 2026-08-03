import 'package:flutter/material.dart';

class AiChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const AiChatBubble({
    super.key,
    required this.message,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isUser
        ? Theme.of(context).colorScheme.primary
        : Colors.grey.shade200;

    final textColor = isUser ? Colors.white : Colors.black87;

    final alignment =
    isUser ? Alignment.centerRight : Alignment.centerLeft;

    final borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(16),
      topRight: const Radius.circular(16),
      bottomLeft:
      isUser ? const Radius.circular(16) : Radius.zero,
      bottomRight:
      isUser ? Radius.zero : const Radius.circular(16),
    );

    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 8,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        child: Text(
          message,
          style: TextStyle(
            color: textColor,
            fontSize: 15,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}