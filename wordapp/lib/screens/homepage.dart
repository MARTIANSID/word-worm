import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuck/Providers/allList.dart';
import 'package:stuck/screens/addWord.dart';
import 'package:stuck/screens/wordDetailScreen.dart';
import 'package:stuck/widgets/fadeanimation.dart';
import 'package:stuck/widgets/textCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

double hheight = 774.8571428571429;
double wwidth = 411.42857142857144;
double heightuix;
double widthuix;

class _HomePageState extends State<HomePage> {
  bool flag = false;
  bool isLoading = false;

  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    Future.delayed(Duration.zero, () async {
      await Provider.of<Words>(context, listen: false).getWords();
      setState(() {
        isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    heightuix = size.height;
    widthuix = size.width / wwidth;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                color: Color(0xFFFFE4E4),
                height: size.height,
                width: size.width,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.0388,
                    ),
                    Container(
                      width: size.width,
                      padding: EdgeInsets.only(left: 32.0, right: 32.0),
                      // padding: EdgeInsets.only(
                      //     left: pad.left * 0.077, right: pad.right * 0.077),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            width: flag == false
                                ? size.width * 0.1216
                                : size.width * 0.67,
                            height: size.height * 0.0607,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:
                                  // flag == false
                                  //     ?
                                  <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.black.withOpacity(0.25),
                                  offset: Offset(3, 3),
                                ),
                              ],
                              // : <BoxShadow>[],
                            ),
                            child: Material(
                              type: MaterialType.transparency,
                              elevation: 6.0,
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                splashColor: Colors.cyan[50].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                                onTap: flag == false
                                    ? () {
                                        setState(() {
                                          flag = true;
                                        });
                                      }
                                    : null,
                                child: flag == false
                                    ? Icon(
                                        Icons.search,
                                        color: Colors.black,
                                        size: 30.0,
                                      )
                                    : TextField(
                                        keyboardType: TextInputType.text,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        style: TextStyle(
                                          fontFamily: "Quicksand Medium",
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Search Wordwrom",
                                          prefixIcon: Icon(
                                            Icons.search,
                                            color: Colors.black,
                                            size: 30.0,
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          flag == false
                              ? Container(
                                  width: size.width * 0.1216,
                                  height: size.height * 0.0607,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Colors.black.withOpacity(0.25),
                                        offset: Offset(3, 3),
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    type: MaterialType.transparency,
                                    elevation: 6.0,
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                    child: InkWell(
                                      splashColor:
                                          Colors.cyan[50].withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AddWord(),
                                          ),
                                        );
                                      },
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: 30.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : FadeInUIX(
                                  delay: 0.5,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        flag = false;
                                      });
                                    },
                                    child: Text(
                                      'Done',
                                      style: TextStyle(
                                        fontFamily: "Quicksand Bold",
                                        fontSize: 20 * widthuix,
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: size.height * 0.075,
                    // ),
                    Container(
                      padding: EdgeInsets.only(left: 32.0, right: 32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    Provider.of<Words>(context, listen: false)
                                        .totalWords
                                        .toString(),
                                    style: TextStyle(
                                      fontFamily: "Quicksand Bold",
                                      fontSize: 25.0 * widthuix,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.006075,
                                  ),
                                  Text(
                                    'Total Words\nLearned',
                                    style: TextStyle(
                                      fontFamily: "Quicksand Regular",
                                      fontSize: 18.0 * widthuix,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Hero(
                                tag: "tag1",
                                child: Image.asset(
                                  'assets/images/tree.png',
                                  height: size.height * 0.25,
                                  width: size.width * 0.35,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              // RotatedBox(
                              //   quarterTurns: -1,
                              //   child: Divider(
                              //     color: Colors.red,
                              //     thickness: 20.0,
                              //   ),
                              // ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    Provider.of<Words>(context, listen: false)
                                        .wordsLearnedToday
                                        .toString(),
                                    style: TextStyle(
                                      fontFamily: "Quicksand Bold",
                                      fontSize: 25.0 * widthuix,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.006075,
                                  ),
                                  Text(
                                    'Today\'s\nProgess',
                                    style: TextStyle(
                                      fontFamily: "Quicksand Regular",
                                      fontSize: 18.0 * widthuix,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              FadeInUIX(
                                delay: 1.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Words Learned Today:',
                                    style: TextStyle(
                                      fontFamily: "Quicksand Bold",
                                      fontSize: 18.0 * widthuix,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            width: size.width * 0.9,
                            // height: size.height * 0.26,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                              // boxShadow: <BoxShadow>[
                              //   BoxShadow(
                              //     blurRadius: 3,
                              //     offset: Offset(3, 3),
                              //     color: Colors.black.withOpacity(0.5),
                              //   )
                              // ],
                            ),
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Provider.of<Words>(context, listen: true)
                                          .wordsLearnedToday ==
                                      0
                                  ? Text('No Words Added')
                                  : Wrap(
                                      spacing: 7.5,
                                      runSpacing: 7.5,
                                      children: List<Widget>.generate(
                                          Provider.of<Words>(context,
                                                  listen: true)
                                              .wordsLearnedToday, (int index) {
                                        return FadeInUIX(
                                          delay: 0.5 * (index + 1),
                                          child: TextCard(
                                            text: Provider.of<Words>(context,
                                                    listen: false)
                                                .words[index]
                                                .title,
                                          ),
                                        );
                                      }),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              FadeInUIX(
                                delay: 1.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Revise Your Learn:',
                                    style: TextStyle(
                                      fontFamily: "Quicksand Bold",
                                      fontSize: 18.0 * widthuix,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    FadeInUIX(
                                      delay: 1.0,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'Words Learned Few Days\nBack: ',
                                          style: TextStyle(
                                            fontFamily: "Quicksand Bold",
                                            fontSize: 15.0 * widthuix,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    FadeInUIX(
                                      delay: 1.5,
                                      child: Container(
                                        width: size.width * 0.23,
                                        // padding: EdgeInsets.all(7.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              offset: Offset(3, 3),
                                            ),
                                          ],
                                        ),
                                        child: Material(
                                          type: MaterialType.transparency,
                                          elevation: 6.0,
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: InkWell(
                                            splashColor: Colors.cyan[50]
                                                .withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      WordDetailScreen(
                                                    textTitle:
                                                        "Words Learned Few Days Back: ",
                                                    // meaningText: nameMeaning,
                                                    // nameText: name,
                                                    // thesaurusText: nameThesaurus,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(7.0),
                                              child: Center(
                                                child: Text(
                                                  "View All",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        "Quicksand Medium",
                                                    fontSize: 13.0 * widthuix,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child:
                                      Provider.of<Words>(context, listen: true)
                                                  .words ==
                                              0
                                          ? Text('No words Added')
                                          : Wrap(
                                              spacing: 7.5,
                                              runSpacing: 7.5,
                                              children: List<Widget>.generate(
                                                  Provider.of<Words>(context,
                                                          listen: true)
                                                      .words
                                                      .length, (int index) {
                                                return FadeInUIX(
                                                  delay: 0.5 * (index + 1),
                                                  child: TextCard(
                                                    text: Provider.of<Words>(
                                                            context,
                                                            listen: true)
                                                        .words[index]
                                                        .title,
                                                  ),
                                                );
                                              }),
                                            ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(top: 10.0),
                          //   width: size.width * 0.9,
                          //   decoration: BoxDecoration(
                          //     color: Colors.black.withOpacity(0.2),
                          //     borderRadius: BorderRadius.circular(10),
                          //   ),
                          //   padding: EdgeInsets.all(10),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: <Widget>[
                          //       Row(
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: <Widget>[
                          //           FadeInUIX(
                          //             delay: 1.0,
                          //             child: Padding(
                          //               padding: const EdgeInsets.only(left: 8.0),
                          //               child: Text(
                          //                 'Words Search Most of\nthe times: ',
                          //                 style: TextStyle(
                          //                   fontFamily: "Quicksand Bold",
                          //                   fontSize: 15.0 * widthuix,
                          //                   color: Colors.white,
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //           FadeInUIX(
                          //             delay: 1.5,
                          //             child: Container(
                          //               width: size.width * 0.23,
                          //               padding: EdgeInsets.all(7.0),
                          //               decoration: BoxDecoration(
                          //                 color: Colors.white,
                          //                 borderRadius: BorderRadius.circular(10),
                          //                 boxShadow: <BoxShadow>[
                          //                   BoxShadow(
                          //                     blurRadius: 4,
                          //                     color: Colors.black.withOpacity(0.25),
                          //                     offset: Offset(3, 3),
                          //                   ),
                          //                 ],
                          //               ),
                          //               child: Material(
                          //                 type: MaterialType.transparency,
                          //                 elevation: 6.0,
                          //                 color: Colors.transparent,
                          //                 borderRadius: BorderRadius.circular(10),
                          //                 child: InkWell(
                          //                   splashColor:
                          //                       Colors.cyan[50].withOpacity(0.5),
                          //                   borderRadius: BorderRadius.circular(10),
                          //                   onTap: () {
                          //                     Navigator.push(
                          //                       context,
                          //                       MaterialPageRoute(
                          //                         builder: (context) => WordDetailScreen(
                          //                             // textTitle:
                          //                             //     "Words Search Most of the times",
                          //                             // meaningText: searchNameMeaning,
                          //                             // nameText: searchName,
                          //                             // thesaurusText:
                          //                             //     searchNameThesaurus,
                          //                             ),
                          //                       ),
                          //                     );
                          //                   },
                          //                   child: Padding(
                          //                     padding: EdgeInsets.all(7.0),
                          //                     child: Center(
                          //                       child: Text(
                          //                         "View All",
                          //                         style: TextStyle(
                          //                           fontFamily: "Quicksand Medium",
                          //                           fontSize: 13.0 * widthuix,
                          //                         ),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       // Padding(
                          //       //   padding: const EdgeInsets.only(top: 15.0),
                          //       //   child: Wrap(
                          //       //     spacing: 7.5,
                          //       //     runSpacing: 7.5,
                          //       //     children: List<Widget>.generate(s,
                          //       //         (int index) {earchName.length
                          //       //       return FadeInUIX(
                          //       //         delay: 0.5 * (index + 1),
                          //       //         child: TextCard(
                          //       //           // text: searchName[index],
                          //       //         ),
                          //       //       );
                          //       //     }),
                          //       //   ),
                          //       // ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
