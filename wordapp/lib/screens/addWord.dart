import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuck/Providers/allList.dart';
import 'package:stuck/widgets/fadeanimation.dart';
import 'package:stuck/widgets/textfieldForAddWord.dart';

class AddWord extends StatefulWidget {
  @override
  _AddWordState createState() => _AddWordState();
}

class _AddWordState extends State<AddWord> {
  final wordController = TextEditingController();
  final descriptionController = TextEditingController();
  final thController = TextEditingController();
  int numValue = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomPadding: false,
        body: Container(
          width: size.width,
          height: size.height,
          color: Color(0xFFFFE4E4),
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Hero(
                tag: "tag1",
                child: Image.asset(
                  'assets/images/tree.png',
                  height: size.height * 0.4,
                  width: size.width,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              FadeInUI(
                delay: 1.0,
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Which new word did you learn?',
                        // textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: "Quicksand Regular",
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.006075,
                      ),
                      Text(
                        'Let\'s say you might have learned a new word like "Nostalgia".',
                        // textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: "Quicksand Regular",
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.0125,
                      ),
                      TextFieldForAddWord(
                        controller: wordController,
                        hintText: "New Word Learned",
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        'What does the new word means?',
                        // textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: "Quicksand Regular",
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.006075,
                      ),
                      Text(
                        'Likewise, Nostalgia means a sentimental longing or wistful affection for a period in the past',
                        // textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: "Quicksand Regular",
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.0125,
                      ),
                      TextFieldForAddWord(
                        controller: descriptionController,
                        hintText: "Description",
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Text(
                        'Thesaurus (Optional)',
                        // textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: "Quicksand Regular",
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 1.0,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.0125,
                      ),
                      TextFieldForAddWord(
                        controller: thController,
                        hintText: "Thesaurus",
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      // Text(
                      //   'Website Links from where you learned!',
                      //   // textAlign: TextAlign.justify,
                      //   style: TextStyle(
                      //     fontFamily: "Quicksand Regular",
                      //     fontSize: 25.0,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.black,
                      //     letterSpacing: 1.0,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: size.height * 0.0125,
                      // ),
                      // ListView.builder(
                      //   itemCount: numValue,
                      //   shrinkWrap: true,
                      //   physics: NeverScrollableScrollPhysics(),
                      //   itemBuilder: (context, index) {
                      //     return TextFieldForAddWord(
                      //       hintText: "Link",
                      //       bottom: 5.0,
                      //     );
                      //   },
                      // ),
                      // SizedBox(
                      //   height: size.height * 0.025,
                      // ),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Container(
                      //     width: size.width * 0.2433,
                      //     height: size.height * 0.0607,
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(10),
                      //       boxShadow: <BoxShadow>[
                      //         BoxShadow(
                      //           blurRadius: 4,
                      //           color: Colors.black.withOpacity(0.25),
                      //           offset: Offset(3, 3),
                      //         ),
                      //       ],
                      //     ),
                      //     child: Material(
                      //       type: MaterialType.transparency,
                      //       elevation: 6.0,
                      //       color: Colors.transparent,
                      //       borderRadius: BorderRadius.circular(10),
                      //       child: InkWell(
                      //         splashColor: Colors.cyan[50].withOpacity(0.5),
                      //         borderRadius: BorderRadius.circular(10),
                      //         onTap: () {
                      //           setState(() {
                      //             numValue++;
                      //           });
                      //         },
                      //         child: Center(
                      //           child: Text(
                      //             "Add Link",
                      //             style: TextStyle(
                      //               fontFamily: "Quicksand Regular",
                      //               color: Colors.black,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Center(
                        child: Container(
                          width: size.width * 0.8,
                          height: size.height * 0.0607,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
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
                            borderRadius: BorderRadius.circular(30),
                            child: InkWell(
                              splashColor: Colors.cyan[50].withOpacity(0.5),
                              borderRadius: BorderRadius.circular(30),
                              onTap: () {
                                setState(() {
                                  numValue++;
                                });
                              },
                              child: GestureDetector(
                                onTap: () async {
                                  await Provider.of<Words>(
                                          context,
                                          listen: false)
                                      .addWord(
                                          title: wordController.text,
                                          description:
                                              descriptionController.text,
                                          th: thController.text);
                                },
                                child: Center(
                                  child: Text(
                                    "Let's Save it For Future Revision",
                                    style: TextStyle(
                                      fontFamily: "Quicksand Bold",
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.045,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
