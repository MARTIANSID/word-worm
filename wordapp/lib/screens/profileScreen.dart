import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 1,
      keepPage: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        child: PageView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          controller: pageController,
          children: <Widget>[
            Container(
              height: size.height,
              width: size.width,
              color: Colors.red,
            ),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.yellow,
            ),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.green,
            ),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
