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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          const SizedBox(height: 20.0,),
          const Column(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Operator(op: '+',),
                  Operator(op: '-'),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Operator(op: '×'),
                  Operator(op: '÷'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20,),
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
  const Operator({super.key, required this.op, });

  @override
  State<Operator> createState() => _OperatorState();
}

class _OperatorState extends State<Operator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 150.0,
      // color: Colors.brown,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.brown),
      child: Text(
        widget.op,
        style: const TextStyle(
          fontSize: 50,
          color: Colors.black45,
        ),
      ),
    );
  }
}

