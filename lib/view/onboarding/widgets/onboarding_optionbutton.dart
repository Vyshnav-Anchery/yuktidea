import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton(
      {super.key,
      required this.imgPath,
      required this.text,
      required this.onTap});
  final String imgPath;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: width / 2.5,
            height: width / 3,
            decoration: ShapeDecoration(
              image: DecorationImage(
                  image: AssetImage(imgPath), fit: BoxFit.cover),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 5, color: Color(0xFF272727)),
                borderRadius: BorderRadius.circular(17),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x35FFFFFF),
                  blurRadius: 14,
                  offset: Offset(-5, -6),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x51000000),
                  blurRadius: 18,
                  offset: Offset(8, 18),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(text)
      ],
    );
  }
}
