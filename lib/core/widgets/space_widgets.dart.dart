import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidthSpaceWidgets extends StatelessWidget {
  final double width;
  WidthSpaceWidgets({required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w);
  }
}

class HightSpaceWidgets extends StatelessWidget {
  final double  height;
  HightSpaceWidgets  ({required this.height});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(height: height.h);
  }
}
