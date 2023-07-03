import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'profile.dart';
import 'package:auth/widgets/firebase.dart';

class Verify extends StatelessWidget {
  final String phone;
  const Verify({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String otp = "";
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 147.sp),
            child: Center(
              child: Text(
                "Verify Phone",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.sp),
            child: Center(
              child: Text(
                "Code is sent to ${phone}",
                style:
                    TextStyle(color: const Color(0xFF6A6C7B), fontSize: 14.sp),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.sp),
            child: OtpTextField(
                onSubmit: (value) => {otp = value.toString()},
                keyboardType: TextInputType.number,
                numberOfFields: 6,
                fillColor: const Color(0xFF93D2F3),
                filled: true),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive the code?",
                  style: TextStyle(color: Color(0xFF6A6C7B)),
                ),
                Text("Request Again")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.sp),
            child: SizedBox(
              width: 328.sp,
              height: 56.sp,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E3B62)),
                  onPressed: () => {
                        signInWithPhoneNumber(phone, otp),
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileSelection()))
                      },
                  child: Text("VERIFY AND CONTINUE",
                      style: TextStyle(
                          color: const Color(0xFFFFFFFF), fontSize: 15.sp))),
            ),
          )
        ],
      ),
    );
  }
}
