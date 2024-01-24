import 'package:doc_booker/core/theming/text_style.dart';
import 'package:flutter/Widgets.dart';

class CreateAccountAndSignUpText extends StatelessWidget {
  const CreateAccountAndSignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Account',
          style: TextStyles.font24BlueBold,
        ),
        Text(
          "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
          style: TextStyles.font14GrayRegular,
        ),
      ],
    );
  }
}
