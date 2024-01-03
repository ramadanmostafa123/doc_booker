import 'package:doc_booker/core/helpers/extentions.dart';
import 'package:doc_booker/core/routing/routes.dart';
import 'package:doc_booker/core/theming/colors.dart';
import 'package:doc_booker/core/theming/text_style.dart';
import 'package:flutter/material.dart';

class GetStartedButtom extends StatelessWidget {
  const GetStartedButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          ColorManager.mainBlue,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(
          const Size(
            double.infinity,
            52,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
