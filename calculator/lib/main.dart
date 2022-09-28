import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp (MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}
List<String> vals =["AC","⌫","÷","×","7","8","9","-","4","5","6","+","1","2","3","=",".","0","00"];
class _CalculatorState extends State<Calculator> {

  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38;
  double resultFontSize = 48;

  buttonPressed(String buttonText){
    setState((){
      if(buttonText == vals[0]){
        equation = "0";
        result = "0";
      }else if(buttonText == vals[1]){
        equation = equation.substring(0, equation.length - 1);
        if(equation == ""){
          equation = "0";
        }
      }else if(buttonText == vals[15]){
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }
      }else{
        if(equation == "0"){
          equation = buttonText;
        }else{
          equation += buttonText;}
      }
    });
  }

  Widget buildButton (String buttonText, double buttonHeight, Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontStyle: FontStyle.normal,
          ),
        ),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.5),
            side: BorderSide(
                color: Colors.white,
                width: 1.0,
                style: BorderStyle.solid
            ),
          ),
          padding: EdgeInsets.all(16.0),
        ),
        onPressed: (){
          buttonPressed(buttonText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''
            'Calculator'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10.0,20.0,10.0,0.0),
            child: Text(equation,
                style: TextStyle(fontSize: equationFontSize, )),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10.0,20.0,10.0,0.0),
            child: Text(result,
                style: TextStyle(fontSize: resultFontSize, )),
          ),
          Expanded(
            child: Divider(
              //color: Colors.grey[800],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton(vals[0], 1, Colors.redAccent),
                        buildButton(vals[1], 1, Colors.blue),
                        buildButton(vals[2], 1, Colors.blue)
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(vals[4], 1, Colors.grey),
                        buildButton(vals[5], 1, Colors.grey),
                        buildButton(vals[6], 1, Colors.grey)
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(vals[8], 1, Colors.grey),
                        buildButton(vals[9], 1, Colors.grey),
                        buildButton(vals[10], 1, Colors.grey)
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(vals[12], 1, Colors.grey),
                        buildButton(vals[13], 1, Colors.grey),
                        buildButton(vals[14], 1, Colors.grey)
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(vals[16], 1, Colors.grey),
                        buildButton(vals[17], 1, Colors.grey),
                        buildButton(vals[18], 1, Colors.grey)
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton(vals[3], 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(vals[7], 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(vals[11], 1, Colors.blue),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(vals[15], 2, Colors.redAccent),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}