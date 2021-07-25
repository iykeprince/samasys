import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoBox extends StatelessWidget {
  const LogoBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'SAMASYS',
            style: GoogleFonts.abel(
              fontSize: 27,
              fontWeight: FontWeight.w400,
              letterSpacing: 10,
              color: Colors.black,
            ),
          ),
          Text(
            'combat salary fraud',
            style: GoogleFonts.lato(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
