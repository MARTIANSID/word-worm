import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuck/widgets/flashcard.dart';
import '../Providers/allList.dart';
import '../screens/homepage.dart';

class WordDetailScreen extends StatelessWidget {
  final String textTitle;
  final List<String> nameText;
  final List<String> meaningText;
  final List<String> thesaurusText;

  const WordDetailScreen(
      {Key key,
      this.textTitle,
      this.nameText,
      this.meaningText,
      this.thesaurusText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xFFFFE4E4),
          height: size.height,
          width: size.width,
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                textTitle,
                style: TextStyle(
                  fontFamily: "Quicksand Bold",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0 * widthuix,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount:
                      Provider.of<Words>(context, listen: false).words.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 7.5, top: 7.5),
                      child: FlashCard(
                        word: Provider.of<Words>(context, listen: false)
                            .words[index]
                            .title,
                        wordMeaning: Provider.of<Words>(context, listen: false)
                            .words[index]
                            .description,
                        link: "https://www.vocabulary.com/lists/22339",
                        thesaurus: Provider.of<Words>(context, listen: false)
                            .words[index]
                            .th,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
