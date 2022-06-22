import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/navigation/screen2.dart';
import 'package:getx/navigation/screen3.dart';
import 'package:getx/navigation/screen4.dart';
import 'package:getx/navigation/screen5.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
  int _counter = 0;
  int returnVal=0;
  Transition transition = Transition.cupertino;

  Column raisedButton() {
    return Column(
      children: [
        RaisedButton(
            onPressed: (){
              Get.offAll(Page2());
            },
          child: Text('전 페이지로 돌아가지 못하게 하기'),
        ),
        Divider(),
        RaisedButton(
          onPressed: (){
            Get.offAll(Page2());
          },
          child: Text('모든 페이지 스택 삭제하기'),
        ),
        Divider(),
        RaisedButton(
          onPressed: (){
            Get.offAll(Page2());
          },
          child: Text('모든 페이지 스택 삭제하기 \n페이지 어갈때 스택 전부 삭제하고 넘어감'),
        ),
        Divider(),
        Text('리턴값: $returnVal'),
        RaisedButton(
          onPressed: () async {
            final resp = await Get.to(Page3());

            setState(() {
              returnVal = resp;
            });
          },
          child: Text('리턴값 받아오기 \n'),
        ),
        Divider(),
        RaisedButton(
          onPressed: (){
            Get.to(Page4(),arguments: '야근해요~');
          },
          child: Text('아규먼트 보내기 \n'),
        ),
        Divider(),
        RaisedButton(
          onPressed: (){
            Get.to(Page2(),transition: Transition.leftToRight);
          },
          child: Text('transition \n'),
        ),
        Divider(),
        RaisedButton(
          onPressed: (){
            Get.toNamed('/five/hoho?id=234&name=fh');
          },
          child: Text('네임드 라우트'),
        ),
        Divider(),
        RaisedButton(
          onPressed: () {
            Get.snackbar(
              '제목',
              '내용',
            );
          },
          child: Text(
            'Snackbar',
          ),
        ),
        Divider(),
        RaisedButton(
          onPressed: () {
            Get.defaultDialog(middleText: 'Dialog');
          },
          child: Text(
            'Dialog',
          ),
        ),
        Divider(),
        RaisedButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                color: Colors.white,
                child: Wrap(
                  children: <Widget> [
                    ListTile(
                      leading: Icon(Icons.music_note),
                      title: Text('Music'),
                      onTap: ()=>{},
                    ),
                    ListTile(
                      leading: Icon(Icons.videocam),
                      title: Text('Video'),
                      onTap: ()=>{},
                    ),
                    ListTile(
                      leading: Icon(Icons.mic),
                      title: Text('Mic'),
                      onTap: ()=>{},
                    ),
                  ],
                ),
              )
            );
          },
          child: Text(
            'Bottom Sheet',
          ),
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
        title: Text(widget.title),
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
              'main Page:',
            ),
            raisedButton(),
          ],
        ),
      ),
    );
  }
}
