import 'package:flutter/material.dart';
import 'package:flutter_map/constants.dart';

class ResultContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0.0,
      right: 0.0,
      left: 0.0,
      child: Container(
        height: size.height * 0.15,
        decoration: BoxDecoration(
          color: kNoResult,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            topLeft: Radius.circular(15.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 2.0,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
            Center(
              child: Text(
                'No Result',
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                  color: kTextResult,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
