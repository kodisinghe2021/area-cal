import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberButton extends StatelessWidget {
  const NumberButton({
    super.key,
    required this.index,
    required this.onTap,
  });
  final int index;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color(0xFF001C30),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            t(index),
            style: style1(),
          ),
        ),
      ),
    );
  }
}

String t(int index) {
  String te = "";
  if (index < 9) {
    te = (index + 1).toString();
  }

  if (index == 9) {
    te = 'C';
  }
  if (index == 11) {
    te = 'H';
  }
  if (index == 10) {
    te = '0';
  }

  return te;
}

TextStyle style1() => GoogleFonts.roboto(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: const Color(0xFFFFF6F4),
    );
