import 'package:flutter/material.dart';

class TextFieldForAddWord extends StatefulWidget {
  final String hintText;
  final int maxLines;
  final double bottom;
  final controller;

  const TextFieldForAddWord(
      {Key key,
      this.hintText,
      this.maxLines = 1,
      this.bottom = 0.0,
      this.controller})
      : super(key: key);
  @override
  _TextFieldForAddWordState createState() => _TextFieldForAddWordState();
}

class _TextFieldForAddWordState extends State<TextFieldForAddWord> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: widget.bottom),
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: TextField(
        controller: widget.controller,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(
          fontFamily: "Quicksand Medium",
          color: Colors.black,
        ),
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          // prefixIcon: Icon(
          //   Icons.edit,
          //   color: Colors.black,
          // ),
        ),
      ),
    );
  }
}
