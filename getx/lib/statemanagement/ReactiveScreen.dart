import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/statemanagement/GetxController.dart';

class ReactiveScreen extends StatefulWidget {
  @override
  _ReactiveScreenState createState() => _ReactiveScreenState();
}

class _ReactiveScreenState extends State<ReactiveScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReactiveController());

    return Scaffold(
      appBar: AppBar(title: Text('Reactive'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Reactive'),
            GetX<ReactiveController>(
              builder: (_) {
                return Text('Count 1 : ${_.count1.value}');
              },
            ),
            Obx(() {
              return Text('Count 2 : ${controller.count2.value}');
            }),
            Obx(() {
              return Text('SUM : ${controller.sum}');
            }),
            Obx(() {
              return Text(
                'USER : ${controller.user.value.id}'
                    '/${controller.user.value.name}',
              );
            }),
            Obx(() {
              return Text('LIST : ${controller.testList}');
            }),
            RaisedButton(
              onPressed: () {
                controller.count1++;
              },
              child: Text(
                'COUNT 1 UP!',
              ),
            ),
            RaisedButton(
              onPressed: () {
                controller.count2++;
              },
              child: Text(
                'COUNT 2 UP!',
              ),
            ),
            RaisedButton(
              onPressed: () {
                controller.change(id: 2, name: '레드벨벳');
              },
              child: Text(
                'Change User',
              ),
            ),
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