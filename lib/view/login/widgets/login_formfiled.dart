import 'package:flutter/material.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({
    required this.prefixIcon,
    required this.hintText,
    this.sufixIcon,
    super.key,
  });
  final String hintText;
  final Icon prefixIcon;
  final Widget? sufixIcon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
          decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: const Color.fromARGB(57, 182, 176, 176),
              prefixIcon: prefixIcon,
              suffixIcon: sufixIcon ?? const SizedBox(),
              border: InputBorder.none)),
    );
  }
}
