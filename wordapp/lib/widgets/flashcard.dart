import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlashCard extends StatefulWidget {
  @override
  _FlashCardState createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
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
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
                offset: Offset(3, 3),
              ),
              BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
                offset: Offset(-3, -3),
              )
            ],
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
                    'Nostalgia',
                    style: TextStyle(
                      fontFamily: "Quicksand Bold",
                      fontSize: 40.0,
                    ),
                  ),
                  Text(
                    'thesaurus: no-stal-juh',
                    style: TextStyle(
                      fontFamily: "Quicksand Regular",
                      fontSize: 16.0,
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
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
                offset: Offset(3, 3),
              ),
              BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
                offset: Offset(-3, -3),
              )
            ],
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
                  'A sentimental longing or wistful affection for a period in the past.',
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
                style:
                    TextStyle(fontFamily: "Quicksand Regular", fontSize: 13.0),
              ),
              Text(
                'https://www.thesaurus.com/browse/nostalgia',
                style: TextStyle(
                  fontFamily: "Quicksand Regular",
                  fontSize: 16.0,
                ),
              )
            ],
          ),
        ));
  }
}
