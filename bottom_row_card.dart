import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void f() {}

class BottomRowCard extends StatelessWidget {
  final String textLabel;
  int num;
  VoidCallback funcMinus;
  VoidCallback funcPlus;

  BottomRowCard(
      {this.textLabel = 'Text',
      this.num = 0,
      this.funcMinus = f,
      this.funcPlus = f});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textLabel,
          style: kLabelTextStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          num.toString(),
          style: kBigLabelTextStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: kFABBackgroundColor,
              onPressed: funcMinus,
              child: Icon(
                FontAwesomeIcons.minus,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: kFABBackgroundColor,
              onPressed: funcPlus,
              child: Icon(
                FontAwesomeIcons.plus,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}
