import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Calculator',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double result = 0;
  String input = '';
  double? num1;
  double? num2;
  String? operator;

  void display(dynamic value) {
    if (double.tryParse(value) != null) {  // If it's a numeric value
      if (operator == null) {  // If there's no operator set, update num1
        setState(() {
          num1 = double.parse(value);
          input = '$num1';
        });
      } else if (num2 == null) {  // If an operator is set but no num2, update num2
        setState(() {
          num2 = double.parse(value);
          input = '$num1 $operator $num2';
        });
      }
    } else if (value == '+' || value == '-' || value == '×' || value == '÷') {  // If it's an operator
      setState(() {
        operator = value;
        input = '$num1 $operator';
      });
    } else if(value == 'C') {
      setState(() {
        input = '';
        result = 0;
        num1 = 0;
        num2 = 0;
        operator = null;
      });
    }
    print("Pressed: $value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.lightGreen[900],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100.0,
            color: Colors.amberAccent,
            alignment: Alignment.bottomRight,
            child: Text(
              input,
              style: const TextStyle(
                fontSize: 40,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 100.0,
            color: Colors.amberAccent,
            alignment: Alignment.bottomRight,
            child: Text(
              '$result',
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              alignment: Alignment.center,
              color: Colors.brown[300],
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        OperatorWidget(op: '7', operation: (value) {display(value);},), // Pass 'value' as a parameter to your function
                        const SizedBox(width: 10,),
                        OperatorWidget(op: '8', operation: (value) {display(value);},),
                        const SizedBox(width: 10,),
                        OperatorWidget(op: '9', operation: (value) {display(value);},),
                        const SizedBox(width: 10,),
                        OperatorWidget(op: '+', operation: (value) {display(value);},),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: Row(
                      children: [
                        OperatorWidget(op: '4', operation: (value) {display(value);},),
                        const SizedBox(width: 10,),
                        OperatorWidget(op: '5', operation: (value) {display(value);},),
                        const SizedBox(width: 10,),
                        OperatorWidget(op: '6', operation: (value) {display(value);},),
                        const SizedBox(width: 10,),
                        OperatorWidget(op: '-', operation: (value) {display(value);},),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: Row(
                      children: [
                        OperatorWidget(op: '1', operation: (value) {display(value);},),
                        const SizedBox(width: 10,),
                        OperatorWidget(op: '2', operation: (value) {display(value);},),
                        const SizedBox(width: 10,),
                        OperatorWidget(op: '3', operation: (value) {display(value);},),
                        const SizedBox(width: 10,),
                        OperatorWidget(op: '×', operation: (value) {display(value);},),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: Row(
                      children: [
                        OperatorWidget(op: 'C', textColor: Colors.red[400], operation: (value) {display(value);},),
                        const SizedBox(width: 10,),
                        OperatorWidget(op: '0', operation: (value) {display(value);},),
                        const SizedBox(width: 10,),
                        OperatorWidget(op: '.', operation: (value) {display(value);},),
                        const SizedBox(width: 10,),
                        OperatorWidget(op: '÷', operation: (value) {display(value);},),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              if(operator == '+'){
                setState(() {
                  result = num1! + num2!;
                });
              } else if(operator == '-'){
                setState(() {
                  result = num1! - num2!;
                });
              } else if(operator == '×'){
                setState(() {
                  result = num1! * num2!;
                });
              } else if(operator == '÷'){
                setState(() {
                  result = num1! / num2!;
                });
              }
            },
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.deepOrangeAccent,
              child: const Text(
                '=',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OperatorWidget extends StatefulWidget {
  final String op;
  final Color? textColor;
  final Function(dynamic)? operation;
  const OperatorWidget({super.key, required this.op, this.textColor = Colors.black45, required this.operation});

  @override
  State<OperatorWidget> createState() => _OperatorWidgetState();
}

class _OperatorWidgetState extends State<OperatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (widget.operation != null) {
            widget.operation!(widget.op); // Pass 'widget.op' as a parameter
          }
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.brown),
          child: Text(
            widget.op,
            style: TextStyle(
              fontSize: 50,
              color: widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}

