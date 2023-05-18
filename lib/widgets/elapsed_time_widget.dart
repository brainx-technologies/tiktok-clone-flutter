import 'dart:async';

import 'package:flutter/material.dart';

import 'package:tiktok_clone/global/app_text_styles.dart';
import 'package:tiktok_clone/global/images.dart';

class ElapsedTimeWidget extends StatefulWidget {
  const ElapsedTimeWidget({Key? key}) : super(key: key);

  @override
  ElapsedTimeWidgetState createState() => ElapsedTimeWidgetState();
}

class ElapsedTimeWidgetState extends State<ElapsedTimeWidget> {
  late Timer _timer;
  Duration _elapsedTime = Duration.zero;
  String _elapsedTimeString = '';

  @override
  void initState() {
    super.initState();
    _elapsedTime = const Duration();
    _elapsedTimeString = _formatDuration(_elapsedTime);
    _timer = Timer.periodic(const Duration(seconds: 1), _updateElapsedTime);
  }

  void _updateElapsedTime(Timer timer) {
    setState(() {
      _elapsedTime += const Duration(seconds: 1);
      _elapsedTimeString = _formatDuration(_elapsedTime);
    });
  }

  String _formatDuration(Duration duration) {
    return '${(duration.inMinutes % 60).toString().padLeft(2, '0')}m';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
          height: 20,
          child: Image(
            image: AssetImage(Images.timer),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          _elapsedTimeString,
          style: CustomTextStyles.baseTextStyleRegular,
        )
      ],
    );
  }
}
