import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:testapplication/feature/Home/home.dart';

import '../../core/app_colors.dart';
import 'login.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  String Otp = " ";
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, bottom: 20, top: 80),
        child: Container(
          width: ScreenUtils().screenWidth(context),
          height: ScreenUtils().screenHeight(context),
          //decoration: AppDecoration.containerDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonTitleText(
                heading: 'Otp Verification',
                subHeading:
                'Provide Valid OTP for verification',
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(top:18.0,left: 18,right: 18),
                child: OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 50,
                  otpFieldStyle: OtpFieldStyle(
                    focusBorderColor: AppColors.primaryButtonColor,
                  ),
                  style: const TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onChanged: (pin) {
                    Otp = pin;
                  },

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:28.0,left: 18,right: 18),

                child: Row(
                  children: [
                    RichText(
                        text:const TextSpan(children: [
                           TextSpan(
                              text:
                              "  ",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              )),



                        ],)),
                  ],
                ),
              ),

              CommonButton(
                onClicked: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()),
                  )
                },
                label: "Verify Your Number",
                buttonHeight: containerWidth * 0.06,
                buttonWidth: containerWidth * 0.8,
                fontSize: 20,
              ),

            ],
          ),

        ),
      ),

    );
  }
}



