import 'package:e_commerce/helper/BottomNavBar.dart';
import 'package:flutter/material.dart';

class Customscafold extends StatelessWidget {
  final Widget body;
  final bool showBottomNavBar;
  final int intialIndex;
  const Customscafold(
      {super.key,
      required this.body,
      required this.showBottomNavBar,
      required this.intialIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: showBottomNavBar
          ? Bottomnavbar(
              intiaIndex: intialIndex,
            )
          : null,
    );
  }
}
