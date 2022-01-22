import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DynamicText extends StatelessWidget {

  final String? title;
  final double? fontSize;
  final FontWeight? fontWeight;

  const DynamicText({Key? key, required this.title, required this.fontSize, this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title',
      style: GoogleFonts.getFont('Poppins').copyWith(
        fontSize: fontSize ?? 20.0,
        fontWeight: fontWeight ?? FontWeight.w900,
        color: Colors.blueGrey,
      )
    );
  }
}
