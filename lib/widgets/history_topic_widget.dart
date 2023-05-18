import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/global/app_text_styles.dart';

class HistoryTopicWidget extends StatelessWidget {
  const HistoryTopicWidget(
      {super.key, required this.name, required this.description});

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 76),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style:
                CustomTextStyles.baseTextStyleRounded.copyWith(fontSize: 18.sp),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: CustomTextStyles.baseTextStyleRounded,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
