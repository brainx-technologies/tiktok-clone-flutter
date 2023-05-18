import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextStyles {
  static TextStyle baseTextStyleRegular = const TextStyle(
    color: Color(0xFFFFFFFF),
    fontFamily: 'SF Pro Regular',
    fontSize: 13,
    letterSpacing: 0,
    fontWeight: FontWeight.normal,
    height: 1,
  );
  static TextStyle baseTextStyleForTabs = TextStyle(
    color: Colors.white,
    fontFamily: 'SF Pro Rounded',
    fontSize: 18.sp,
    letterSpacing: 0,
    height: 1.2,
  );
  static TextStyle baseTextStyleRounded = TextStyle(
    fontFamily: 'SF Pro Rounded',
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontSize: 15.sp,
  );
  static TextStyle selectedLabelStyle = const TextStyle(
    color: Colors.white,
    fontSize: 10.0,
    letterSpacing: 0.0,
  );
  static TextStyle unselectedLabelStyle = TextStyle(
    color: Colors.white.withOpacity(0.4),
    fontSize: 10.0,
    letterSpacing: 0.0,
  );
  static TextStyle unselectedTabTextStyle = baseTextStyleForTabs.copyWith(
    fontWeight: FontWeight.w400,
  );

  static TextStyle selectedTabTextStyle = baseTextStyleForTabs.copyWith(
    fontWeight: FontWeight.w700,
  );
}
