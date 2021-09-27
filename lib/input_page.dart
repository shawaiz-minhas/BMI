import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './resuable_color_card.dart';
import './bmi-calcu.dart';
import './calculate_page.dart';
const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor =Color(0xffEB1555);
const InactiveCardColor = Color(0xff111328);
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int Height = 180;
  int Weight = 60;
  int Age = 19;
  Color maleCardColor = InactiveCardColor;
  Color femaleCardColor = InactiveCardColor;
  void UpdateColor(int gender){
  if(gender==1)
    if(maleCardColor == InactiveCardColor){
      maleCardColor = activeCardColor;
      femaleCardColor = InactiveCardColor;
    }else{
      maleCardColor = InactiveCardColor;
    }
  if(gender==2)
  if(femaleCardColor == InactiveCardColor){
    femaleCardColor = activeCardColor;
    maleCardColor = InactiveCardColor;
  }else{
    femaleCardColor = InactiveCardColor;
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR BY MS-MINHAS')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    UpdateColor(1);
                  });
                },
                child: ResuableCode(
                  color: maleCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(FontAwesomeIcons.mars,size: 80,),
                     SizedBox(height: 15,),
                     Text('MALE',style: TextStyle(
                       fontSize: 18,
                       color: Color(0xff8D8E98)
                     ),)
                   ],
                  ),
                ),
              )
              ),
              Expanded(child:GestureDetector(
                onTap: (){
                  setState(() {
                    UpdateColor(2);
                  });
                },
                child: ResuableCode(
                  color: femaleCardColor,
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.venus,size: 80,),
                      SizedBox(height: 15,),
                      Text('FEMALE',style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff8D8E98)
                      ),)
                    ],
                  ),
                ),
              )
              )
            ],
          )),
          Expanded(
              child:
          ResuableCode(
            childCard: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text('Height',style: TextStyle(
               fontSize: 18,
              color: Color(0xff8D8E98)
                     ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(Height.toString(),style: TextStyle(
                        fontSize: 50,
                        color: Color(0xff8D8E98),
                        fontWeight: FontWeight.bold),),
                    Text('cm',style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff8D8E98)
                    ),),

                  ],
                ),
                SliderTheme(data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xff8D8E98),
                  activeTrackColor: Colors.white,
                  thumbColor: Color(0xffEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                ), child: Slider
                (
                  value: Height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  activeColor: Color(0xffEB1555),
                  inactiveColor: Color(0xff8D8E98),
                  onChanged: (double newValue){
                    setState(() {
                      Height = newValue.round();
                    });
                  },
                ),
                )
              ],
            ),
            color: activeCardColor,)
          ),
          Expanded(child: Row(
            children: [
              Expanded(
                  child: ResuableCode(
                    color: activeCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight',style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff8D8E98)
                        ),),
                        Text(Weight.toString(),style: TextStyle(
                        fontSize: 50,
                          color: Color(0xff8D8E98),
                          fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                Weight--;
                              });
                            },),
                            SizedBox(width: 10,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                              setState(() {
                                Weight++;
                              });
                              },
                            ),


                          ],
                        )
                      ],
                    ),
                  )
              ),
              Expanded(
                  child:ResuableCode
                    (color: activeCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age',style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff8D8E98)
                        ),),
                        Text(Age.toString(),style: TextStyle(
                            fontSize: 50,
                            color: Color(0xff8D8E98),
                            fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  Age--;
                                });
                              },),
                            SizedBox(width: 10,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  Age++;
                                });
                              },
                            ),


                          ],
                        )
                      ],
                    ),
                  )
              )
            ],
          )
          ),
          BottomButton(
            onTap: (){
              CalculatorBrain  calc = CalculatorBrain(Weight: Weight,Height: Height);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>Calculate_Page(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                  Instructions: calc.getInstruction()
                  )));
            },
            buttonTile: 'Calculate',
          )
        ],
      )
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTile, required this.onTap});
  final VoidCallback onTap;
  final String buttonTile;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttonTile,style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
        ),
        color: bottomContainerColor,
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height:bottomContainerHeight,
      ),
    );
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon,required this.onPressed});
  final IconData icon;
  final VoidCallback  onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4C4F5E),
    );
  }
}
