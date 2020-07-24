import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import '../screens/homepage.dart';

class FlashCard extends StatelessWidget {
  final String word;
  final String thesaurus;
  final String wordMeaning;
  final String link;

  const FlashCard(
      {Key key, this.word, this.thesaurus, this.wordMeaning, this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      speed: 1000,
      front: Container(
        padding: EdgeInsets.only(left: 18, right: 18.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     blurRadius: 4,
          //     color: Colors.black.withOpacity(0.25),
          //     offset: Offset(3, 3),
          //   ),
          //   BoxShadow(
          //     blurRadius: 4,
          //     color: Colors.black.withOpacity(0.25),
          //     offset: Offset(-3, -3),
          //   )
          // ],
        ),
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.1895,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  word,
                  style: TextStyle(
                    fontFamily: "Quicksand Bold",
                    fontSize: 33.0 * widthuix,
                  ),
                ),
                Text(
                  'thesaurus: ' + thesaurus,
                  style: TextStyle(
                    fontFamily: "Quicksand Regular",
                    fontSize: 15.0 * widthuix,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 24.0,
            )
          ],
        ),
      ),
      back: Container(
        padding: EdgeInsets.only(left: 18, right: 18.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     blurRadius: 4,
          //     color: Colors.black.withOpacity(0.25),
          //     offset: Offset(3, 3),
          //   ),
          //   BoxShadow(
          //     blurRadius: 4,
          //     color: Colors.black.withOpacity(0.25),
          //     offset: Offset(-3, -3),
          //   )
          // ],
        ),
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.1895,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Description',
              style: TextStyle(
                fontFamily: "Quicksand Regular",
                fontSize: 13.0,
              ),
            ),
            Container(
              width: size.width * 0.8,
              child: Text(
                wordMeaning,
                style: TextStyle(
                  fontFamily: "Quicksand Bold",
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01215,
            ),
            Text(
              'Link:',
              style: TextStyle(fontFamily: "Quicksand Regular", fontSize: 13.0),
            ),
            Text(
              link,
              style: TextStyle(
                fontFamily: "Quicksand Regular",
                fontSize: 16.0 * widthuix,
              ),
            )
          ],
        ),
      ),
    );
  }
}
