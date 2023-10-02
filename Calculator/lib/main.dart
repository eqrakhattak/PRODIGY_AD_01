import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200.0,
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
                  const Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Operator(op: '7'),
                        SizedBox(width: 10,),
                        Operator(op: '8'),
                        SizedBox(width: 10,),
                        Operator(op: '9'),
                        SizedBox(width: 10,),
                        Operator(op: '+',),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Expanded(
                    child: Row(
                      children: [
                        Operator(op: '4'),
                        SizedBox(width: 10,),
                        Operator(op: '5'),
                        SizedBox(width: 10,),
                        Operator(op: '6'),
                        SizedBox(width: 10,),
                        Operator(op: '-'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Expanded(
                    child: Row(
                      children: [
                        Operator(op: '1'),
                        SizedBox(width: 10,),
                        Operator(op: '2'),
                        SizedBox(width: 10,),
                        Operator(op: '3'),
                        SizedBox(width: 10,),
                        Operator(op: '×'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: Row(
                      children: [
                        Operator(op: 'C', textColor: Colors.red[400],),
                        const SizedBox(width: 10,),
                        const Operator(op: '0'),
                        const SizedBox(width: 10,),
                        const Operator(op: '.'),
                        const SizedBox(width: 10,),
                        const Operator(op: '÷'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
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
        ],
      ),
    );
  }
}

class Operator extends StatefulWidget {
  final String op;
  final Color? textColor;
  const Operator({super.key, required this.op, this.textColor = Colors.black45});

  @override
  State<Operator> createState() => _OperatorState();
}

class _OperatorState extends State<Operator> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          print('result');
        },
        child: Container(
          // height: 100.0,
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

