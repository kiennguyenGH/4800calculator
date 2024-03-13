import 'package:calculator_4800/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var textField = '';
  var textCalc = '';

  final List<String> buttonList =
      [
        'C', 'DEL', '', '/',
        '7', '8', '9', 'x',
        '4', '5', '6', '-',
        '1', '2', '3', '+',
        '0', '.', '', '=',
      ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 25,
            child: Container(
              color: Colors.black87,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.only(right: 20, bottom: 10),
                  child: Text(
                    textField,
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
              ),
            )
          ),
          Expanded(
            flex: 50,
            child: Container(
              color: Colors.black87,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: buttonList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index){
                  if (index == 0) {
                    return Button(
                      onTapped: ()
                      {
                        setState(() {
                          textField = '';
                        });
                      },
                      text: buttonList[index],
                      color: Colors.black26,
                      fontColor: Colors.white,
                      height: 50,
                      width: 50,
                    );
                  }
                  if (index == 1) {
                    return Button(
                      onTapped: ()
                      {
                        setState(() {
                          textField = textField.substring(0, textField.length - 1);
                        });
                      },
                      text: buttonList[index],
                      color: Colors.black26,
                      fontColor: Colors.white,
                      height: 50,
                      width: 50,
                    );
                  }
                  if (index == 2 || index == 18) {
                    return Button(
                      text: buttonList[index],
                      color: Colors.transparent,
                      fontColor: Colors.white,
                      height: 50,
                      width: 50,
                    );
                  }
                  else {
                    return Button(
                      onTapped: ()
                      {
                        setState(() {
                          textField += buttonList[index];
                        });
                      },
                      text: buttonList[index],
                      color: isOperator(buttonList[index]) ? Colors.blue : Colors.black26,
                      fontColor: Colors.white,
                      height: 50,
                      width: 50,
                    );
                  }
                },
              )
            )
          )
        ],
      )
    );


  }

  bool isOperator(String input)
  {
    if (input == '/' || input == 'x' || input == '+' || input == '-' || input == '=')
    {
      return true;
    }
    return false;
  }
}
