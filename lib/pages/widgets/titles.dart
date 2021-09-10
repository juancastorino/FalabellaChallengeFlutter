import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Titles extends StatelessWidget {
  final String texto;
  final double margin;

  const Titles({
    Key? key,
    required this.texto,
    required this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: margin),
      child: Text(texto,
          style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.w500)),
    );
  }
}
