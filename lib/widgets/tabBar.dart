// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key, required this.tabBarController});
  final TabController tabBarController;
  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height / 2,
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    iconSize: 80,
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.burger),
                  ),
                  Text("Melaku Solomon"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.locationDot),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Mekelle"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
