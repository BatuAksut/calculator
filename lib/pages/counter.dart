import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  TextEditingController myController = TextEditingController();
  int _currentNumber = 0;
  int _previousNumber = 0;
  String _operation = '';

  @override
  void initState() {
    super.initState();
    myController = TextEditingController();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _performOperation(String operation) {
    setState(() {
      _operation = operation;
      _previousNumber = int.tryParse(myController.text) ?? 0;
      myController.clear();
    });
  }

  void _calculateResult() {
    setState(() {
      int enteredNumber = int.tryParse(myController.text) ?? 0;
      switch (_operation) {
        case 'c':
          _currentNumber = 0;
        case '+':
          _currentNumber = _previousNumber + enteredNumber;
          break;
        case '-':
          _currentNumber = _previousNumber - enteredNumber;
          break;
        case '*':
          _currentNumber = _previousNumber * enteredNumber;
          break;
        case '/':
          if (enteredNumber != 0) {
            _currentNumber = _previousNumber ~/ enteredNumber;
          } else {
            print("hata");
          }
          break;
      }
      myController.text = _currentNumber.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              "Calculator",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.teal,
            centerTitle: true),
        backgroundColor: Colors.teal[200],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  controller: myController,
                  decoration: InputDecoration(hintText: '0'),
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => _performOperation('+'),
                        child: Icon(Icons.add, color: Colors.white),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 19, 26, 25))),
                      ),
                      ElevatedButton(
                        onPressed: () => _performOperation('-'),
                        child: Icon(Icons.remove, color: Colors.white),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 19, 26, 25)),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () => _performOperation('*'),
                          child: Text(
                            "*",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 19, 26, 25)))),
                      ElevatedButton(
                        onPressed: () => _performOperation('/'),
                        child: Text(
                          '÷',
                          style: TextStyle(fontSize: 24.0, color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 19, 26, 25),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _calculateResult,
                        child: Text(
                          '=',
                          style: TextStyle(fontSize: 24.0, color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 19, 26, 25),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _performOperation('c'),
                        child: Text(
                          'C',
                          style: TextStyle(fontSize: 24.0, color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 19, 26, 25),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
