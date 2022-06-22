import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/statemanagement/onupdatescreen.dart';

class GetxStateManagementScreen extends StatefulWidget {
  @override
  _GetxStateManagementScreenState createState() =>
      _GetxStateManagementScreenState();
}

class _GetxStateManagementScreenState extends State<GetxStateManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('GetX StateManagement'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Get.to(OnUpdateScreen());
              },
              child: Text('On Update'),
            ),

            // RaisedButton(
            //   onPressed: (){
            //     Get.to(ReactiveScreen());
            //   },
            //   child: Text('Reactive'),
            // ),
          ],
        ),
      ),
    );
  }
}