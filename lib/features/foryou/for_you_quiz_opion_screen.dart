import 'package:flutter/material.dart';

import 'package:tiktok_clone/global/app_colors.dart';

class ForYouQuizOptionScreen extends StatelessWidget {
  final String option;
  final bool isSelected;
  final bool isCorrect;
  final bool isAnswered;
  final Widget? imageWidget;
  final VoidCallback onTap;

  const ForYouQuizOptionScreen({
    Key? key,
    required this.option,
    required this.isSelected,
    required this.isCorrect,
    required this.isAnswered,
    required this.imageWidget,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = isAnswered
        ? (isCorrect
            ? AppColors.correctColor
            : (isSelected ? AppColors.selectedColor : AppColors.answeredColor))
        : AppColors.answeredColor;

    return Padding(
      padding: const EdgeInsets.only(right: 70),
      child: GestureDetector(
          onTap: isAnswered ? null : onTap,
          child: Column(
            children: [
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: color,
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Text(
                          option,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: imageWidget, // Use the nullable widget here
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
