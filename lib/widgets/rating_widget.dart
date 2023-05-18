import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/global/app_colors.dart';
import 'package:tiktok_clone/global/app_constants.dart';

import '../global/app_text_styles.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget({super.key});

  @override
  RatingWidgetState createState() => RatingWidgetState();
}

class RatingWidgetState extends State<RatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 70, bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppConstants.howWell,
                style: CustomTextStyles.baseTextStyleRounded
                    .copyWith(color: const Color(0x99ffffff))),
            const SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 1; i <= 5; i++)
                    Expanded(
                      child: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: _getSelectedColor(i)),
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "$i",
                                  style: CustomTextStyles.baseTextStyleRounded
                                      .copyWith(
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getSelectedColor(int rating) {
    switch (rating) {
      case 1:
        return AppColors.tango;
      case 2:
        return AppColors.rajah;
      case 3:
        return AppColors.musturd;
      case 4:
        return AppColors.eden;
      case 5:
        return AppColors.emerald;
      default:
        return Colors.white;
    }
  }
}
