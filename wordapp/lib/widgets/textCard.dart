import 'package:flutter/material.dart';
import 'package:stuck/screens/homepage.dart';

class TextCard extends StatelessWidget {
  final String text;

  const TextCard({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10.0),
      width: size.height * 0.18,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.black.withOpacity(0.5),
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Quicksand Regular',
            fontSize: 14.0 * widthuix,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
