import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodDetail extends StatefulWidget {
  final data;

  const FoodDetail({super.key, this.data});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    bool _isSmall = MediaQuery.of(context).size.height < 600;
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Positioned(
          child: Hero(
            tag: widget.data,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/" + widget.data["img"],
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: Colors.black.withOpacity(0),
          ),
        ),
        Positioned(
          top: _isSmall ? _height / 2 - 10 : _height / 2 + 50,
          width: MediaQuery.of(context).size.width,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.all(_isSmall ? 5 : 15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.data["price"]}Birr",
                          style: TextStyle(
                              fontSize: _isSmall ? 15 : 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("15 Min",
                            style: TextStyle(
                                fontSize: _isSmall ? 15 : 24,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text("${widget.data["name"]}",
                        style: TextStyle(
                            fontSize: _isSmall ? 15 : 20, color: Colors.blue)),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < widget.data["rate"]
                                    ? Colors.yellow
                                    : Colors.grey,
                                size: _isSmall ? 20 : 25,
                              );
                            }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "(${widget.data["rate"]})",
                            style: TextStyle(
                                fontSize: _isSmall ? 15 : 25,
                                color: Colors.black.withOpacity(0.5)),
                          )
                        ],
                      )),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description:",
                          style: TextStyle(
                            fontSize: _isSmall ? 15 : 20,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: SingleChildScrollView(
                                child: Text(
                              "${widget.data["desc"]}",
                              style: TextStyle(
                                  fontSize: _isSmall ? 12 : 17,
                                  color:
                                      const Color.fromARGB(255, 107, 104, 104)),
                            )),
                          ),
                        ),
                        Container()
                      ],
                    ),
                  )),
                  Container(
                    padding: EdgeInsets.all(15),
                    //bottom buttons
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _quantity == 1
                                    ? this._quantity = 1
                                    : this._quantity -= 1;
                              });
                            },
                            child: Container(
                              height: _isSmall ? 40 : 50,
                              width: _isSmall ? 40 : 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: _isSmall ? 30 : 40),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("${_quantity}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                this._quantity += 1;
                              });
                            },
                            child: Container(
                              height: _isSmall ? 40 : 50,
                              width: _isSmall ? 40 : 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:
                                      const Color.fromARGB(255, 50, 121, 52)),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: _isSmall ? 30 : 40),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: _isSmall ? 40 : 50,
                              width: _isSmall ? 40 : 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:
                                      const Color.fromARGB(255, 50, 121, 52)),
                              child: Center(
                                child: Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: _isSmall ? 18 : 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
          ),
        ),
        Positioned(
            left: _isSmall ? _width / 2 - 50 : _width / 2 - 75,
            top: _isSmall ? _height / 2 - 60 : _height / 2 - 25,
            height: _isSmall ? 100 : 150,
            width: _isSmall ? 100 : 150,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/' + widget.data['img']),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(100)),
            ))
      ]),
    );
  }
}
