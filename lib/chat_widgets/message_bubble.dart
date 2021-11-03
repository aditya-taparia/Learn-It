import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble();

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        width: 200,
        height: 50,
        padding: EdgeInsets.all(14),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          children: [
            Text(
              "hello",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      )
    ]);
  }
}
