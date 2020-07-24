import 'package:flutter/material.dart';
import 'package:stuck/screens/addWord.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    duration: Duration(milliseconds: 800),
                    width:
                        flag == false ? size.width * 0.1216 : size.width * 0.7,
                    height: size.height * 0.0607,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: flag == false
                          ? <BoxShadow>[
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
                            ]
                          : <BoxShadow>[],
                    ),
                    child: Material(
                      type: MaterialType.transparency,
                      elevation: 6.0,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        splashColor: Colors.cyan[50].withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        child: flag == false
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    flag = true;
                                  });
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 30.0,
                                  ),
                                ),
                              )
                            : TextField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 30.0,
                                )),
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
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              flag = false;
                            });
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(
                              fontFamily: "Quicksand Bold",
                              fontSize: 20,
                            ),
                          )),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.075,
            ),
            Container(
              width: size.width * 0.9,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
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
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(children: <Widget>[
                      Text('Total Words Learned',
                          style: TextStyle(
                              fontFamily: 'Quicksand Bold', fontSize: 16)),
                      Text(
                        '20',
                        style: TextStyle(
                            fontFamily: 'Quicksand Regular', fontSize: 18),
                      )
                    ]),
                    Column(children: <Widget>[
                      Text('Words Learned Today',
                          style: TextStyle(
                              fontFamily: 'Quicksand Bold', fontSize: 16)),
                      Text(
                        '5',
                        style: TextStyle(
                            fontFamily: 'Quicksand Regular', fontSize: 18),
                      )
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
