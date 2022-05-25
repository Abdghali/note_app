import 'package:flutter/material.dart';
class Page1 extends StatefulWidget {
  Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Page 1',style: TextStyle(fontFamily:'mysoul',fontSize: 100),),),
    );
  }
}