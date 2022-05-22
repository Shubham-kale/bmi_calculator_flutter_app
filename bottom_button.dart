import 'package:flutter/material.dart';
import 'constants.dart';

void callback() {
  print('Bottom Button Pressed');
}

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;

  BottomButton(
      {@required this.onTap = callback, @required this.buttonTitle = ''});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLabelTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(
          top: 10,
        ),
        height: kBottomContainerHeight,
      ),
    );
  }
}
