import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_app/models/mycard.dart';

class MyCard extends StatefulWidget {
  MyNote? myNote;
  MyCard({this.myNote});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  String? myText =
      'Text messaging, or texting, is the act of composing and sending electronic messages, typically consisting of alphabetic and numeric characters, between two or more users of mobile devices, desktops/laptops, or another type of compatible computer. Text messages may be sent over a cellular network, or may also be sent via an Internet connection.';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.myNote!.title??"Empty",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.myNote!.subTitle!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
            Random().nextInt(255), 1),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
