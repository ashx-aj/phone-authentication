import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_picker/country_picker.dart';
import 'package:auth/widgets/firebase.dart';
import 'verify.dart';

class MobileNo extends StatefulWidget {
  const MobileNo({super.key});

  @override
  State<MobileNo> createState() => _MobileNoState();
}

Country selected = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "");

class _MobileNoState extends State<MobileNo> {
  TextEditingController input = TextEditingController();
  String phn = "";

  @override
  void dispose() {
    // Dispose the text editing controller when the widget is disposed
    input.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //input.text = AppLocalizations.of(context).head3;
    SnackBar snack;
    String phnNo;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 152.sp),
            child: Center(
              child: Text(AppLocalizations.of(context).head1,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontFamily: "Roboto")),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 9.sp),
            child: Center(
              child: Text(
                AppLocalizations.of(context).head2,
                maxLines: 2,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: const Color(0xFF6A6C7B), fontSize: 14.sp),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 36.sp),
            child: SizedBox(
              width: 327.sp,
              child: TextFormField(
                  controller: input,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => setState(() {
                        phn = value.trim();
                        print(phn);
                      }),
                  decoration: InputDecoration(
                      prefixIcon: InkWell(
                        onTap: () => showCountryPicker(
                            countryListTheme:
                                CountryListThemeData(bottomSheetHeight: 425.sp),
                            context: context,
                            onSelect: (Country value) {
                              setState(() {
                                selected = value;
                              });
                            }),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 12.sp, left: 10.sp, right: 10.sp),
                          child: Text(
                              "${selected.flagEmoji}  +  ${selected.phoneCode}"),
                        ),
                      ),
                      hintText: AppLocalizations.of(context).head3,
                      enabledBorder: _border(),
                      focusedBorder: _border()),
                  style: TextStyle(color: Colors.black, fontSize: 15.sp)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 32.sp),
            child: SizedBox(
              width: 328.sp,
              height: 56.sp,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E3B62)),
                  onPressed: () => {
                        if (phn.trim() == "")
                          {
                            print("empty"),
                            snack = const SnackBar(
                                content: Text("Enter a mobile no")),
                            ScaffoldMessenger.of(context).showSnackBar(snack),
                          }
                        else
                          {
                            phnNo = "+${selected.phoneCode}${phn.trim()}",
                            signInWithPhoneNumber(phnNo, ""),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Verify(phone: phnNo)))
                          }
                      },
                  child: Text(AppLocalizations.of(context).head4,
                      style: TextStyle(
                          color: const Color(0xFFFFFFFF), fontSize: 15.sp))),
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2.sp),
        borderRadius: const BorderRadius.all(Radius.zero));
  }
}
