
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Bottom.dart';
import 'CalcBrain.dart';
import 'ResultPage.dart';
import 'icon.dart';
import 'ExpendContainer.dart';
import 'dart:ui';

const highButton = 60.0;
const ColorExpend = Color(0xFF1D1E33);
const ColorButton = Colors.pink;
const inActivColor = Color(0xFF111328);
enum Gender {
  male,
  female,
}

class DisAble extends StatefulWidget {
  @override
  _DisAbleState createState() => _DisAbleState();
}

class _DisAbleState extends State<DisAble> {
  Gender selcted;
  int number = 190;
  int weight = 74;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selcted = Gender.male;
                      });
                    },
                    child: Reusble(
                      colour:
                      selcted == Gender.male ? inActivColor : ColorExpend,
                      card: CardInput(
                        icons: FontAwesomeIcons.mars,
                        texts: ('MALE'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selcted = Gender.female;
                      });
                    },
                    child: Reusble(
                      colour:
                      selcted == Gender.female ? inActivColor : ColorExpend,
                      card: CardInput(
                        icons: FontAwesomeIcons.venus,
                        texts: ('FEMALE'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusble(
              colour: ColorExpend,
              card: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        number.toString(),
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: number.toDouble(),
                      min: 110.0,
                      max: 230.0,
                      inactiveColor: Colors.grey,
                      onChanged: (double newNum) {
                        setState(() {
                          number = newNum.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusble(
                    colour: ColorExpend,
                    card: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              press: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              press: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusble(
                      colour: ColorExpend,
                      card: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                press: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                press: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          BottomUp(
            title: 'CALCULATE',
            Tap: () {
              CalcBrain calc = new CalcBrain(height: number, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                        CalcBmi: calc.CalcBmi(),
                        getResult: calc.getResult(),
                        getStatues: calc.getStatues(),
                      )));
            },
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.press});
  final IconData icon;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: press,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
