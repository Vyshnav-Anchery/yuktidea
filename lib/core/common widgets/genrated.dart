import 'package:flutter/material.dart';

class CodiaPage extends StatefulWidget {
  CodiaPage({super.key});

  @override
  State<StatefulWidget> createState() => _CodiaPage();
}

class _CodiaPage extends State<CodiaPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      width: 123,
      height: 42,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            width: 123,
            top: 0,
            height: 42,
            child: Container(
              width: 123,
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xff212426),
                border: Border.all(color: const Color(0x14000000), width: 2),
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                      color: const Color(0x28000000),
                      offset: Offset(6, 6),
                      blurRadius: 12),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8, top: 8, right: 40, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7),
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Idle',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              color: const Color(0xfff9d3b4),
                              fontFamily: 'Gilroy-Medium',
                              fontWeight: FontWeight.normal),
                          maxLines: 9999,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
