import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auth/widgets/routebutton.dart';

class ProfileSelection extends StatefulWidget {
  const ProfileSelection({Key? key}) : super(key: key);

  @override
  State<ProfileSelection> createState() => _ProfileSelectionState();
}

class _ProfileSelectionState extends State<ProfileSelection> {
  var selected = "Shipper";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 147.sp),
            child: Center(
              child: Text(
                "Please select your profile",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          _radiobutton(context, "Shipper", "assets/images/icon1.jpg"),
          _radiobutton(context, "Transporter", "assets/images/icon2.jpg"),
          Padding(
            padding: EdgeInsets.only(top: 30.sp),
            child: const Button(text: "CONTINUE"),
          )
        ],
      ),
    );
  }

  Padding _radiobutton(BuildContext context, String title, String img) {
    return Padding(
      padding: EdgeInsets.only(top: 30.sp),
      child: SizedBox(
        width: 328.sp,
        height: 89.sp,
        child: ListTile(
            contentPadding: EdgeInsets.all(10.sp),
            shape: Border.all(color: Colors.black),
            title: Text(
              title,
              style: TextStyle(color: Color(0xFF2F3037), fontSize: 16.sp),
            ),
            subtitle: const Text(
                "Lorem ipsum dolor sit amet consectetuer adipiscing "),
            leading: SizedBox(
              width: 100.sp,
              child: Row(
                children: [
                  Radio<String>(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xFF2E3B62)),
                    value: title,
                    groupValue: selected,
                    onChanged: (value) => setState(() {
                      selected = value.toString();
                    }),
                  ),
                  Image.asset(img, width: 40.sp, height: 40.sp)
                ],
              ),
            )),
      ),
    );
  }
}
