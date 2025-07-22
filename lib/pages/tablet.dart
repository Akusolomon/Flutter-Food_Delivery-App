import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubit/food_cubit.dart';
import '../widgets/body.dart';
import 'FoodDetail.dart';
import 'foodDetailTab.dart';

class TabletHomePage extends StatefulWidget {
  const TabletHomePage({super.key});

  @override
  State<TabletHomePage> createState() => _TabletHomePageState();
}

class _TabletHomePageState extends State<TabletHomePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);
    bool _isSmall = MediaQuery.of(context).size.height < 600;
    double _height = MediaQuery.of(context).size.height;
    return BlocBuilder<FoodCubit, FoodState>(builder: (context, state) {
      if (state is LoadingState) {
        print(state);
        return CircularProgressIndicator();
      } else if (state is LoadedState) {
        return Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: _isSmall ? _height / 2 - 25 : _height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/handu-1.jpg'),
                      fit: _isSmall ? BoxFit.fill : BoxFit.cover),
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: _isSmall ? 30 : 50, left: 20, right: 20),
              child: Column(
                children: [Body(ctx: context)],
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height / 2,
                child: SizedBox(
                  height: _isSmall ? 5 : 20,
                )),
            Positioned(
                top: _isSmall ? _height / 2 - 15 : _height / 2 + 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,
                      height: _isSmall ? 50 : 90,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          labelColor: Colors.black,
                          labelPadding: EdgeInsets.only(left: 20, right: 20),
                          unselectedLabelColor: Colors.grey,
                          controller: tabController,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: CircleIndicator(_isSmall),
                          isScrollable: true,
                          tabs: [
                            Container(
                              width: _isSmall ? 35 : 65,
                              height: _isSmall ? 50 : 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(270),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/icons/burger.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              width: _isSmall ? 35 : 65,
                              height: _isSmall ? 50 : 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(270),
                                image: DecorationImage(
                                    image: AssetImage('assets/icons/pizza.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              width: _isSmall ? 35 : 65,
                              height: _isSmall ? 50 : 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(270),
                                image: DecorationImage(
                                    image: AssetImage('assets/icons/kebab.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              width: _isSmall ? 35 : 65,
                              height: _isSmall ? 50 : 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(270),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/icons/french-fries.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Container(
                              width: _isSmall ? 35 : 65,
                              height: _isSmall ? 50 : 85,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(270),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/icons/milkshake.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: _isSmall ? 170 : 220,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Container(
                              height: 200,
                              margin: EdgeInsets.only(left: 20),
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.foods.length,
                                itemBuilder: (BuildContext context, int index) {
                                  print(state.foods);
                                  return Hero(
                                    tag: state.foods[index],
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FoodDetailTablet(
                                              
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(right: 5, top: 8),
                                        width: _isSmall ? 160 : 210,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/${state.foods[index]["img"]}',
                                              ),
                                              fit: BoxFit.cover),
                                        ),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${MediaQuery.of(context).size.width.round()}, ${_height.round()}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Container(
                                                  height: _isSmall ? 50 : 70,
                                                  width: _isSmall ? 50 : 70,
                                                  decoration: BoxDecoration(
                                                    color: Colors.pink,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                    ),
                                                  ),
                                                  child: Center(
                                                      child: Material(
                                                    color: Colors.transparent,
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      icon: FaIcon(
                                                          FontAwesomeIcons.add),
                                                    ),
                                                  )),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )),
                          Text("Food"),
                          Text("Pizza"),
                          Text("Food"),
                          Text("Food"),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        );
      } else {
        return Center(
          child: Text("Error "),
        );
      }
    });
  }
}

class CircleIndicator extends Decoration {
  final small;
  CircleIndicator(this.small);
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(this.small);
  }
}

class _CirclePainter extends BoxPainter {
  final small;
  _CirclePainter(this.small);
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = Colors.teal;
    _paint.isAntiAlias = true;
    final Offset _circOffset =
        Offset(configuration.size!.width / 2, configuration.size!.height / 2);
    canvas.drawCircle(offset + _circOffset, small ? 30 : 45, _paint);
  }
}
