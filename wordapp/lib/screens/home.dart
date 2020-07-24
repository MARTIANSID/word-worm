import 'package:flutter/material.dart';
import 'package:stuck/screens/homepage.dart';
import 'package:stuck/screens/profileScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabcontroller;
  @override
  void initState() {
    super.initState();
    tabcontroller = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              TabBarView(
                controller: tabcontroller,
                children: <Widget>[
                  ProfileScreen(),
                  HomePage(),
                ],
              ),
              Container(
                height: size.height * 0.06075,
                width: size.width * 0.3649,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(5),
                child: TabBar(
                  controller: tabcontroller,
                  indicatorColor: Colors.transparent,
                  indicator: BoxDecoration(
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                  ),
                  // labelPadding: EdgeInsets.all(10),
                  tabs: <Widget>[
                    Icon(
                      Icons.person_outline,
                      size: 25.0,
                      color: Colors.black,
                    ),
                    Icon(
                      Icons.home,
                      size: 25.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
