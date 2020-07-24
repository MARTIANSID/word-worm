import 'package:flutter/material.dart';

class AddWord extends StatefulWidget {
  @override
  _AddWordState createState() => _AddWordState();
}

class _AddWordState extends State<AddWord> {
  int numValue = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Image.asset(
              'assets/images/tree.png',
              height: size.height * 0.4,
              width: size.width,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Which new word did you learn?',
                    // textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Text(
                    'Let\'s say you might have learned a new word like "Nostalgia".',
                    // textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
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
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelText: "New Word Learned",
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    'What does the new word means?',
                    // textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Text(
                    'Likewise, Nostalgia means a sentimental longing or wistful affection for a period in the past',
                    // textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
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
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Description",
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    'Thesaurus (Optional)',
                    // textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Container(
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
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelText: "Thesaurus",
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    'Website Links from where you learned!',
                    // textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  ListView.builder(
                    itemCount: numValue,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 5.0),
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
                        child: TextField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            labelText: "Link",
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.attachment,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: size.width * 0.2433,
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
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.black.withOpacity(0.25),
                            offset: Offset(-3, -3),
                          )
                        ],
                      ),
                      child: Material(
                        type: MaterialType.transparency,
                        elevation: 6.0,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          splashColor: Colors.cyan[50].withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            setState(() {
                              numValue++;
                            });
                          },
                          child: Center(
                            child: Text(
                              "Add Link",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
