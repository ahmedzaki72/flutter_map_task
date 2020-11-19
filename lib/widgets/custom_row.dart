import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final String content;

  CustomRow({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$title : ',
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text('$content'),
      ],
    );
  }
}
