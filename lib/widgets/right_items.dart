import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/global/app_text_styles.dart';

import 'package:tiktok_clone/global/images.dart';

class RightItems extends StatefulWidget {
  final VoidCallback onStarButtonClicked;

  const RightItems({super.key, required this.onStarButtonClicked});

  @override
  State<RightItems> createState() => _RightItemsState();
}

class _RightItemsState extends State<RightItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            userLogo(),
            const SizedBox(height: 15),
            const _StatisticWidget(
              icon: AssetImage(Images.heart),
              label: "87",
            ),
            const SizedBox(height: 15),
            const _StatisticWidget(
              icon: AssetImage(Images.comments),
              label: "2",
            ),
            const SizedBox(height: 15),
            const _StatisticWidget(
              icon: AssetImage(Images.share),
              label: "17",
            ),
            const SizedBox(height: 15),
            const _StatisticWidget(
              icon: AssetImage(Images.bookmark),
              label: "203",
            ),
            const SizedBox(height: 15),
            _StatisticWidget(
                icon: const AssetImage(Images.flip),
                label: "Flip",
                onStarButtonClicked: widget.onStarButtonClicked),
          ],
        ),
      ),
    );
  }

  Widget userLogo() {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(Images.profileAvatar),
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            width: 20.0,
            height: 30.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}

class _StatisticWidget extends StatefulWidget {
  final AssetImage icon;
  final String label;
  final VoidCallback? onStarButtonClicked;

  const _StatisticWidget({
    required this.icon,
    required this.label,
    this.onStarButtonClicked,
  });

  @override
  State<_StatisticWidget> createState() => _StatisticWidgetState();
}

class _StatisticWidgetState extends State<_StatisticWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onStarButtonClicked,
      child: SizedBox(
        width: 45,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                  onTap: widget.onStarButtonClicked,
                  child: Image(image: widget.icon)),
            ),
            const SizedBox(height: 8),
            Text(
              widget.label,
              textAlign: TextAlign.center,
              style: CustomTextStyles.baseTextStyleRounded
                  .copyWith(fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
