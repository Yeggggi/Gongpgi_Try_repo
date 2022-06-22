import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/navigation/mainscreen.dart';
import 'package:getx/navigation/screen2.dart';
import 'package:getx/navigation/screen3.dart';
import 'package:getx/navigation/screen4.dart';
import 'package:getx/navigation/screen5.dart';
import 'package:getx/statemanagement/getxStateManagement.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Demo',
      home: GetxStateManagementScreen(),
      // home: MyHomePage(title: '',), // navigation폴더 사용할 때
      getPages: [
        GetPage(
          name: '/',
          page: () => MyHomePage(title: '',),
        ),
        GetPage(
          name: '/two',
          page: () => Page2(),
        ),
        GetPage(
          name: '/three',
          page: () => Page3(),
        ),
        GetPage(
          name: '/four',
          page: () => Page4(),
        ),
        GetPage(
          name: '/five/:param',
          page: () => Page5(),
        ),
      ],
    );
  }
}