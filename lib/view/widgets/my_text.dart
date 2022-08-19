import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class myText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  TextDecoration? decoration;
  final FontWeight fontWeight;
   myText(
      {Key? key,
      required this.text,
      required this.size,
      required this.color,
      required this.fontWeight, this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      
      text,
      style: GoogleFonts.lato(
          textStyle:
              TextStyle(color: color, fontSize: size, fontWeight: fontWeight , decoration: decoration)),
    );
  }
}
