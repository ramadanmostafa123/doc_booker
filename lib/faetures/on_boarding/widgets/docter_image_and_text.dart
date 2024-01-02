import 'package:doc_booker/core/theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DocterImageAndText extends StatelessWidget {
  const DocterImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svgs/doc_logo_lowopasity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.18, 0.4],
            ),
          ),
          child: Image.asset('assets/images/docter.png'),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Text(
            'Best Doctor\nAppointment App',
            style: TextStyles.font32BlueBold.copyWith(height: 1.4),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
