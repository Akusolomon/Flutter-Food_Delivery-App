
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/food_cubit.dart';
import 'pages/mapi.dart';
import 'pages/mobile.dart';
import 'pages/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: AppHome(),
      ),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   home: AppHome(),
    // );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class AppHome extends StatefulWidget {
  const AppHome();

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> with TickerProviderStateMixin {
  @override
  void initState() {
    BlocProvider.of<FoodCubit>(context).getFoods();
    super.initState();
  }

  int _selectedIndex = 0;
  void _navTap(value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Mapi(),
      // Responsive(
      //     mobileBody: MobileHomePage(),
      //     tabletBody: TabletHomePage(),
      //     destopBody: Container()),
      body: Responsive(mobileBody: MobileHomePage(),tabletBody: Container(), destopBody: Container(),),
      drawer: Drawer(
        child: Column(
          // mainAxisAlignment: ,
          children: [
            // HEader
            Container(
              height: MediaQuery.of(context).size.height / 4,
              // width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                image: DecorationImage(
                    opacity: 0.4,
                    image: AssetImage('assets/images/images1.jpeg'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                          image: AssetImage('assets/images/images1.jpeg'),
                          fit: BoxFit.cover),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 30,
                        width: 95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                          color: Colors.black.withOpacity(0.6),
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.penToSquare,
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ),
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
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 20, top: 30),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {},
                        leading: FaIcon(
                          FontAwesomeIcons.paypal,
                          size: 29,
                          color: Colors.blue.withRed(4),
                        ),
                        title: Text(
                          "PayMent History",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: FaIcon(
                          FontAwesomeIcons.heart,
                          size: 29,
                          color: Colors.blue.withRed(4),
                        ),
                        title: Text(
                          "Interests",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: FaIcon(
                          FontAwesomeIcons.pizzaSlice,
                          size: 29,
                          color: Colors.blue.withRed(4),
                        ),
                        title: Text(
                          "My Orders",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: FaIcon(
                          FontAwesomeIcons.gears,
                          size: 29,
                          color: Colors.blue.withRed(4),
                        ),
                        title: Text(
                          "Settings",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 20),
                  child: ListTile(
                    onTap: () {},
                    leading: FaIcon(
                      FontAwesomeIcons.arrowRightFromBracket,
                      color: Colors.red,
                      size: 25,
                    ),
                    title: Text(
                      "LogOut",
                      style: TextStyle(color: Colors.red, fontSize: 25),
                    ),
                  )),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: SalomonBottomBar(
          currentIndex: _selectedIndex,
          onTap: (value) => _navTap(value),
          items: [
            SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("home"),
                selectedColor: Colors.pink),
            SalomonBottomBarItem(
                icon: Icon(Icons.favorite_border),
                title: Text("Days"),
                selectedColor: Colors.orange),
            SalomonBottomBarItem(
                icon: Icon(Icons.search),
                title: Text("About"),
                selectedColor: Colors.purple),
            SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("About"),
                selectedColor: Colors.teal)
          ],
        ),
      ),
    );
  }
}
