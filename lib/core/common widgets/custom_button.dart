import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  CustomButton(
      {super.key,
      required this.text,
      this.isPressed = false,
      required this.onPressed});
  final String text;
  bool isPressed;
  final Function() onPressed;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    double blur = 5;
    Offset distance = const Offset(2, 2);
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isPressed = !widget.isPressed;
        });
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            widget.isPressed = !widget.isPressed;
          });
        });
        widget.onPressed();
      },
      child: Container(
        height: 40,
        width: MediaQuery.sizeOf(context).width / 2,
        decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
                color:
                    const Color.fromARGB(255, 164, 155, 155).withOpacity(0.5),
                spreadRadius: 1.5,
                blurRadius: blur,
                offset: -distance,
                inset: widget.isPressed),
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1.5,
                blurRadius: blur,
                offset: distance,
                inset: widget.isPressed),
          ],
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: widget.isPressed
                  ? Colors.white.withOpacity(0.019999999552965164)
                  : const Color.fromARGB(255, 33, 36, 38),
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          color: widget.isPressed
              ? Theme.of(context).scaffoldBackgroundColor
              : const Color.fromARGB(255, 33, 36, 38),
        ),
        child: Center(
            child: Text(
          widget.text,
          style: TextStyle(
              color: widget.isPressed
                  ? Color.fromARGB(102, 249, 211, 180)
                  : Colors.white),
        )),
      ),
    );
  }
}
