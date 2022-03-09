import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var numberController1 = TextEditingController();
  var numberController2 = TextEditingController();
  int result = 0;

  void process1() {
    setState(() {
      result =
          int.parse(numberController1.text) + int.parse(numberController2.text);
      numberController1.clear();
      numberController2.clear();
    });
  }

  void process2() {
    setState(() {
      result =
          int.parse(numberController1.text) - int.parse(numberController2.text);
      numberController1.clear();
      numberController2.clear();
    });
  }

  void process3() {
    setState(() {
      result =
          int.parse(numberController1.text) * int.parse(numberController2.text);
      numberController1.clear();
      numberController2.clear();
    });
  }

  void process4() {
    setState(() {
      result = int.parse(numberController1.text) ~/
          int.parse(numberController2.text);
      numberController1.clear();
      numberController2.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff263238),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(widget.title,
                  style: TextStyle(
                      color: Color(0xffffb300),
                      fontSize: 27.0,
                      fontWeight: FontWeight.w900)),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 100.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 80.0,
                    height: 40.0,
                    color: Color(0xff263238),
                    child: Text(
                      result.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                child: TextFormField(
                  controller: numberController1,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Sayı 1',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50.0, right: 50.0, bottom: 40.0),
                child: TextField(
                  controller: numberController2,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Sayı 2',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        process1();
                      },
                      child: Text('+'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff263238),
                      )),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                      onPressed: () {
                        process2();
                      },
                      child: Text('-'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff263238),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        process4();
                      },
                      child: Text('/'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff263238),
                      )),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                      onPressed: () {
                        process3();
                      },
                      child: Text('x'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff263238),
                      ))
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
