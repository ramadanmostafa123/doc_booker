import 'package:doc_booker/core/theming/text_style.dart';
import 'package:doc_booker/faetures/on_boarding/widgets/docter_image_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/doc_logo_and_name.dart';
import '../widgets/get_started_buttom.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const DocLogoAndName(),
                SizedBox(
                  height: 30.h,
                ),
                const DocterImageAndText(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Text(
                        'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience',
                        style: TextStyles.font13GrayRegular,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      const GetStartedButtom(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
