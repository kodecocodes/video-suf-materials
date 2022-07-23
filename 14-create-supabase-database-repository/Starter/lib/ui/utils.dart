import 'package:flutter/material.dart';

const startGradientColor = Color(0xFF2C93F1);
const endGradientColor = Color(0xFF1465AE);
const textColor = Colors.white;
const inverseTextColor = Colors.black;
const blackBorderColor = Color(0xFF353535);
const dividerColor = Color(0xFFE4E4E4);
const lightBlueColor = Color(0xFF524FEC);
const lightGreyColor = Color(0xFF797979);

const titleBlackText = TextStyle(fontSize: 24, fontWeight: FontWeight.w600);
const titleText = TextStyle(
    fontSize: 36, fontWeight: FontWeight.w600, color: blackBorderColor);
const largeBlackText = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
const largeWhiteText =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);
const smallBlackText = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
  color: Color(0xFF353535),
);
const smallBlueText = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
  color: Color(0xFF524FEC),
);

BoxDecoration createGradient() {
  return const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [startGradientColor, endGradientColor]),
  );
}

BoxDecoration createSimiRoundedBorder() {
  return const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(6.0),
      topRight: Radius.circular(6.0),
      bottomLeft: Radius.circular(16.0),
      bottomRight: Radius.circular(4.0),
    ),
  );
}

BoxDecoration createWhiteBorder() {
  return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.0),
      boxShadow: [
        BoxShadow(
            blurRadius: 16.0,
            offset: const Offset(0.0, 4.0),
            color: Colors.black.withOpacity(0.1))
      ]);
}

BoxDecoration createBlackBorderedBox() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(6.0),
    border: Border.all(color: blackBorderColor),
  );
}

RoundedRectangleBorder createWhiteRoundedBorder() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
    side: const BorderSide(width: 1, color: Color(0xFFE0E0E0)),
  );
}

InputDecoration createTextBorder(String hint, IconButton? endingButton) {
  return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      suffixIcon: endingButton);
}
