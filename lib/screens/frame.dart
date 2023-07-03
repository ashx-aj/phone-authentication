import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auth/widgets/routebutton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/dropdown.dart';
import 'mobile.dart';

class Frame extends StatelessWidget {
  const Frame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned(
          top: 158.sp,
          left: 152.sp,
          child: Image.asset("assets/images/image1.jpg",
              width: 56.sp, height: 56.sp)),
      Positioned(
        top: 259.sp,
        //left: 70.sp,
        child: SizedBox(
          width: 360.sp,
          height: 30.sp,
          child: Center(
            child: Text(
              AppLocalizations.of(context).heading1,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Roboto"),
            ),
          ),
        ),
      ),
      Positioned(
        top: 291.5.sp,
        left: 72.sp,
        child: SizedBox(
          width: 220.sp,
          height: 37.3.sp,
          child: Text(
            AppLocalizations.of(context).heading2,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: const Color(0xFF6A6C7B),
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto"),
          ),
        ),
      ),
      Positioned(
          top: 360.sp,
          left: 72.sp,
          child: Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF2F3037))),
              height: 48.sp,
              width: 216.sp,
              child: const Dropdownlist())),
      Positioned(
        top: 428.sp,
        left: 72.sp,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MobileNo()));
          },
          child: Button(text: AppLocalizations.of(context).heading3),
        ),
      ),
      Positioned(
        bottom: 0.sp,
        left: 0.sp,
        child: Image.asset(
          "assets/images/Vector.jpg",
          fit: BoxFit.fill,
          width: 360.sp,
          height: 112.89.sp,
        ),
      ),
      Positioned(
        bottom: 0.sp,
        left: 0.sp,
        child: Image.asset(
          "assets/images/Vector2.jpg",
          fit: BoxFit.fill,
          width: 360.sp,
          height: 102.89.sp,
        ),
      )
    ]));
  }
}
