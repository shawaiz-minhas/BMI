import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'resuable_color_card.dart';
import './input_page.dart';
class Calculate_Page extends StatelessWidget {
Calculate_Page({required this.bmiResult,required this.Instructions,required this.resultText});
final String bmiResult;
final String resultText;
final String Instructions;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff0A0E21),
          scaffoldBackgroundColor: Color(0xff0A0E21)
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container(
              padding: EdgeInsets.all(15),
              child: Text('Your Results',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50
                ),
              ),
            ),
            ),
            Expanded(
              flex: 5,
              child: ResuableCode(
                color: activeCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,style: TextStyle(
                      color: Color(0xff24D876),
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 100
                      ),
                    ),
                    Text(Instructions,style:
                      TextStyle(
                        fontSize: 22
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            BottomButton(buttonTile: 'Re-Calculate', onTap: (){
              Navigator.pop(context);
            })
          ],
        )
      ),
    );
  }
}
