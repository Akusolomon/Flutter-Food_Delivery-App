// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/cart.dart';

class Body extends StatefulWidget {
  const Body({super.key, this.ctx});
  final ctx;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(40),
          //   child: Container(
          //     color: const Color.fromARGB(255, 103, 146, 181),
          //     width: 60,
          //     height: 60,
          //     child: Icon(
          //       Icons.person_sharp,
          //       color: Colors.pink,
          //     ),
          //   ),
          // ),

          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: FaIcon(FontAwesomeIcons.barsStaggered),
          ),

          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Cart(),
                ),
              );
            },
            icon: FaIcon(FontAwesomeIcons.cartShopping),
          )
        ],
      ),
    );
  }
}
