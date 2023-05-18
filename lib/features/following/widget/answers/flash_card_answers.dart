import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/global/app_constants.dart';
import 'package:tiktok_clone/global/app_text_styles.dart';

import 'package:tiktok_clone/data/models/flash_cards.dart';

class FlashCardAnswer extends StatefulWidget {
  const FlashCardAnswer({super.key, required this.data});
  final Flashcard data;

  @override
  FlashCardAnswerState createState() => FlashCardAnswerState();
}

class FlashCardAnswerState extends State<FlashCardAnswer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        Text(
          widget.data.flashcardFront,
          style: CustomTextStyles.baseTextStyleRounded.copyWith(
              fontSize: 21.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xb2ffffff)),
        ),
        const SizedBox(height: 24),
        const Divider(
          color: Colors.grey,
          thickness: 1,
          height: 1,
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppConstants.answer,
                style: CustomTextStyles.baseTextStyleRounded.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xff2dc59f)),
              ),
              const SizedBox(height: 4),
              Text(
                widget.data.flashcardBack,
                style: CustomTextStyles.baseTextStyleRounded.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xb2ffffff)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
