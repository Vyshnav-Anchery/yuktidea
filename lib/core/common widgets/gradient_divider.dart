import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  final double height;
  final double thickness;
  final double leftMargin;
  final double rightMargin;

  const GradientDivider({
    Key? key,
    this.height = 1.0,
    this.thickness = 1.0,
    this.leftMargin = 0.0,
    this.rightMargin = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            const Color.fromARGB(57, 182, 176, 176),
            Theme.of(context).primaryColor,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
