import 'package:flutter/material.dart';
import '../../core/values/values.dart';
import 'package:google_fonts/google_fonts.dart';

enum PrimaryButtonSizes { small, medium, large }

class AppPrimaryButton extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;
  final String buttonText;
  final VoidCallback? callback;

  const AppPrimaryButton(
      {Key? key,
      this.callback,
      required this.buttonText,
      required this.buttonHeight,
      required this.buttonWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.black,
      ),
      child: ElevatedButton(
          onPressed: callback,
          style: ButtonStyles.primaryDecoration,
          child: Text(buttonText,
              style: GoogleFonts.lato(
                  fontSize: 12,
                  shadows: [
                    const Shadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 1.0),
                  ],
                  fontWeight: FontWeight.w500,
                  color: Colors.white))),
    );
  }
}
