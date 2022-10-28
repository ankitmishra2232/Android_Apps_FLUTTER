import 'package:flutter/material.dart';

import 'home.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Battery APK';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text(appTitle)),
        ),
        body: const Center(child: MyHomePage()),
      ),
    );
  }



}
