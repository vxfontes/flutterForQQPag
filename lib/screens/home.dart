import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/color_dot.dart';
import 'package:alubank/components/sections/header.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Header(),
          BoxCard(boxComponent: ColorDot(color: ThemeColors.recentActivitySpent)),
        ],
      ),
    );
  }
}
