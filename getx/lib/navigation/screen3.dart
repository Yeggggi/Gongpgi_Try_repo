import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/navigation/screen2.dart';





class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  int _counter = 0;
  var radioVal;
  // int value=0;
  Column raisedButton() {
    return Column(
      children: [
        Row(
            children:[
              Radio(
                value: 0,
                groupValue: radioVal,
                onChanged: (value){
                  setState(() {
                    radioVal = value;
                  });
                },
              ),
              Text('0'),
            ],
        ),
        Row(
          children:[
            Radio(
              value: 1,
              groupValue: radioVal,
              onChanged: (value){
                setState(() {
                  radioVal = value;
                });
              },
            ),
            Text('1'),
          ],
        ),
        Row(
          children:[
            Radio(
              value: 2,
              groupValue: radioVal,
              onChanged: (value){
                setState(() {
                  radioVal = value;
                });
              },
            ),
            Text('2'),
          ],
        ),

        RaisedButton(
          onPressed: (){
            Get.back(result: radioVal);
          },
          child: Text('뒤로가기'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.

          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Page3',
            ),
            raisedButton(),
          ],
        ),
      ),
    );
  }
}
