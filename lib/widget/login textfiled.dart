import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFiledX extends StatelessWidget {
  const TextFiledX(
      {Key? key,
      required this.title,
      required this.hint,
      required this.prefIcon,
       this.obscure = false,
      this.suffex})
      : super(key: key);

  final String title;
  final String hint;
  final Icon prefIcon;
  final Icon? suffex;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.cairo(fontSize: 16),
        ),
        TextFormField(
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefIcon,

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.redAccent)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
