import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/data/models/flash_cards.dart';
import 'package:tiktok_clone/global/app_text_styles.dart';

class FlashCardQuizQuestionTextWidget extends StatelessWidget {
  const FlashCardQuizQuestionTextWidget({super.key, required this.data});

  final Flashcard data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            data.flashcardFront,
            style: CustomTextStyles.baseTextStyleRounded.copyWith(
                fontSize: 21.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xb2ffffff)),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
