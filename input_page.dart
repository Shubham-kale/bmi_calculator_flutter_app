import 'package:bmi_app/main.dart';
import 'package:bmi_app/results_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_row_card.dart';
import 'bottom_button.dart';
import 'calculation_logic.dart';

enum Gender { male, female, other }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.other;
  int weight = 60;
  int height = 150;
  double _currentSliderValue = 150;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF090C22),
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      iData: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      iData: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          height.toString(),
                          style: kBigLabelTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 10,
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 20,
                            ),
                          ),
                          child: Slider.adaptive(
                            value: _currentSliderValue,
                            max: 250,
                            divisions: 250,
                            label:
                                _currentSliderValue.round().toString() + ' cm',
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
                                height = value.toInt();
                              });
                            },
                            thumbColor: Color(0xFFEA1556),
                            inactiveColor: Color(0xFF888895),
                            activeColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: BottomRowCard(
                      num: weight,
                      textLabel: 'WEIGHT',
                      funcMinus: () {
                        setState(() {
                          weight--;
                        });
                      },
                      funcPlus: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: BottomRowCard(
                      num: age,
                      textLabel: 'AGE',
                      funcPlus: () {
                        setState(() {
                          age++;
                        });
                      },
                      funcMinus: () {
                        setState(() {
                          age--;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE YOUR BMI',
            onTap: () {
              CalculateBMI calc = CalculateBMI(height: height, weight: weight);
              //Navigator.pushNamed(context, '/result');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult().toUpperCase(),
                      interpretation: calc.getInterpretation()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
