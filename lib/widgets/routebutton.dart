import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final String text;
  const Button({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: const Color(0xFF2E3B62), border: Border.all()),
      height: 48.sp,
      width: 216.sp,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: const Color(0xFFFFFFFF), fontSize: 15.sp),
        ),
      ),
    );
  }
}
