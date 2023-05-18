import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tiktok_clone/global/app_text_styles.dart';
import 'package:tiktok_clone/global/images.dart';

class PlaylistWidget extends StatelessWidget {
  const PlaylistWidget({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.20),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 0.0),
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: Image(
                    image: AssetImage(Images.playlist),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Playlist: $data",
                textAlign: TextAlign.left,
                style: CustomTextStyles.baseTextStyleRounded
                    .copyWith(fontSize: 13.sp),
              ),
            ],
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 30,
                height: 30,
                child: Image(
                  image: AssetImage(Images.rightArrow),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
