import 'package:samasys/samasys_ui.dart';
import 'package:samasys/src/shared/app_colors.dart';
import 'package:samasys/src/shared/styles.dart';
import 'package:flutter/material.dart';

class BoxButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool busy;
  final Widget? leading;
  final bool outline;
  final void Function()? onPress;
  BoxButton({
    Key? key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.leading,
    this.outline = false,
    this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
        child: AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      width: double.infinity,

      alignment: Alignment.center,
      
      decoration: !outline ? BoxDecoration(
        color: disabled ? kcMediumGreyColor : kcPrimaryColor,
        borderRadius: BorderRadius.circular(0),
      ) : BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: kcPrimaryColor, width:  1),
      ),
      child: !busy ? Row(mainAxisSize: MainAxisSize.min, children: [
        if(leading != null ) leading!,
        if(leading != null ) SizedBox(width: 5),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            title, 
            style: bodyStyle.copyWith(
              fontWeight: !outline ? FontWeight.bold : FontWeight.w400,
              color: !outline ? Colors.white : kcPrimaryColor,
            ),),
        ),
      ],) 
          : CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white), strokeWidth: 8,),
    ));
  }
}
