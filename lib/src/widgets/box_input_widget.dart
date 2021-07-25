import 'package:samasys/src/shared/app_colors.dart';
import 'package:flutter/material.dart';

class BoxInputField extends StatelessWidget {
  final void Function(String)? onChanged; 
  final String placeholder;
  final String? errorText;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? trailingTapped;
  final bool password;

  final boxBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
  );

  BoxInputField({Key? key,
    required this.onChanged,
    this.placeholder = '',
    this.errorText,
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.password = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: TextStyle(height: 1),
      obscureText: password,
      decoration: InputDecoration(
        errorText: errorText,
        helperStyle: TextStyle(fontSize: 16),
        hintText: placeholder,
        contentPadding: 
          const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        filled: true,
        fillColor: kcVeryLightGreyColor,
        prefixIcon: leading,
        suffixIcon: trailing != null ? GestureDetector(child: trailing, onTap: trailingTapped) : null,
        border: boxBorder.copyWith(
          borderSide: BorderSide(color: kcPrimaryColor)
        ),
        errorBorder: boxBorder.copyWith(
          borderSide: BorderSide(color: Colors.red)
        ),
        focusedBorder: boxBorder.copyWith(
          borderSide: BorderSide(color: kcPrimaryColor)
        ),
        enabledBorder: boxBorder.copyWith(
          borderSide: BorderSide(color: kcPrimaryColor)
        )
      ),
    );
  }
}