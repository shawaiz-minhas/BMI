import 'package:flutter/material.dart';
import './input_page.dart';
import './calculate_page.dart';

void main(){
  runApp(BMICAL());
}
class BMICAL extends StatelessWidget {
  const BMICAL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/result':(context)=> Calculate_Page(resultText: '', bmiResult: '', Instructions: '',)
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff0A0E21),
          scaffoldBackgroundColor: Color(0xff0A0E21)
      ),
      home: InputPage(),
    );
  }
}
