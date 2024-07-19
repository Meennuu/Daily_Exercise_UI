import 'package:dailyexerciseui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavItem(
            svgScr: "assets/icons/calendar.svg",
            title: "Today",
            press: () {},
          ),
          BottomNavItem(
            svgScr: "assets/icons/gym.svg",
            title: "All Exercises",
            isActive: true,
            press: () {},
          ),
          BottomNavItem(
            svgScr: "assets/icons/Settings.svg",
            title: "Settings",
            press: () {},
          )
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr, title;
  final VoidCallback press;
  bool isActive;
  BottomNavItem(
      {super.key,
      required this.svgScr,
      required this.title,
      required this.press,
      this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            svgScr,
            color: isActive ? kActiveIconColor : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          )
        ],
      ),
    );
  }
}
