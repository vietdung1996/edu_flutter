
import 'package:flutter/material.dart';
import 'package:lecture_4/app/app.dart';

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  void updateAppState(){
    MyApp.instance.appState = 10;
  }

  void getAppState(){
    print(MyApp.instance.appState);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

