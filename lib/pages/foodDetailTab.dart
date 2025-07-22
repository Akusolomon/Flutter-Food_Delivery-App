import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodDetailTablet extends StatefulWidget {
  final data;

  const FoodDetailTablet({super.key, this.data});

  @override
  State<FoodDetailTablet> createState() => _FoodDetailTabletState();
}

class _FoodDetailTabletState extends State<FoodDetailTablet> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
