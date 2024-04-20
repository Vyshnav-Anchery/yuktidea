import 'package:flutter/material.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        // height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(-2, -2),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              icon,
              color: Colors.white,
            )),
      ),
    );
  }
}
