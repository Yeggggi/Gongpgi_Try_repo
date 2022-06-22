import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/statemanagement/GetxController.dart';

class OnUpdateScreen extends StatefulWidget {
  @override
  _OnUpdateScreenState createState() => _OnUpdateScreenState();
}

class _OnUpdateScreenState extends State<OnUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BuilderController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'On Update',
            ),
            GetBuilder<BuilderController>( // <>에 가져오고싶은 controller 넣음

              builder: (_){
                  return Text('count: ${_.count}');

                },
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                  // Get.find<BuilderController>().increment(); // controller를 위에 선언해주면 아래처럼 간단하게 쓸수있다.
                  controller.increment();
                });
              },
              child:
              Text('count up!!'),
            ),
            SizedBox(height:10,),
            RaisedButton(
              onPressed: (){
                Get.back();
              },
              child:
              Text('뒤로가기'),
            ),
          ],
        ),
      ),
    );
  }
}