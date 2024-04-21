import 'package:flutter/material.dart';

class OTPInputField extends StatefulWidget {
  final Function(String) onChanged;

  const OTPInputField({Key? key, required this.onChanged}) : super(key: key);

  @override
  _OTPInputFieldState createState() => _OTPInputFieldState();
}

class _OTPInputFieldState extends State<OTPInputField> {
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (_) => TextEditingController());
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        4,
        (index) => SizedBox(
          width: 40.0,
          child: TextField(
            controller: _controllers[index],
            onChanged: (value) {
              if (value.length == 1 && index < 3) {
                FocusScope.of(context).nextFocus();
              }
              if (value.length == 0 && index > 0) {
                FocusScope.of(context).previousFocus();
              }
              if (_controllers
                  .every((controller) => controller.text.isNotEmpty)) {
                widget.onChanged(
                    _controllers.map((controller) => controller.text).join());
              }
            },
            maxLength: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              counterText: "",
            ),
          ),
        ),
      ),
    );
  }
}
