import 'package:dailyexerciseui/Widgets/bottom_nav_bar.dart';
import 'package:dailyexerciseui/Widgets/search_bar.dart';
import 'package:dailyexerciseui/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: const BoxDecoration(
                color: kBlueLightColor,
                image: DecorationImage(
                    image: AssetImage("assets/images/meditation_bg.png"),
                    fit: BoxFit.fitWidth)),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Meditation",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "3-10 Min Course",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width * 0.6,
                    child: const Text(
                        "Live happier and healthier by learning the fundamentals of meditation and mindfulness."),
                  ),
                  SizedBox(
                      width: size.width * 0.5, child: const CustomSearchBar()),
                  Wrap(
                    spacing: 12,
                    runSpacing: 20,
                    children: [
                      SessionCard(
                        sessionNum: 01,
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 02,
                        isDone: false,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 03,
                        isDone: false,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 04,
                        isDone: false,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 05,
                        isDone: false,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 06,
                        isDone: false,
                        press: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Meditation",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.all(20),
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 23,
                              spreadRadius: -13,
                              color: kShadowColor)
                        ]),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            "assets/icons/Meditation_women_small.svg"),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Basic 2",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            const Text("Start your deepen you practice.")
                          ],
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset("assets/icons/Lock.svg"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  final VoidCallback press;
  const SessionCard({
    super.key,
    required this.sessionNum,
    this.isDone = false,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
            width: constraints.maxWidth / 2 - 6,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 17),
                      blurRadius: 23,
                      spreadRadius: -23,
                      color: kShadowColor)
                ]),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: press,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        height: 42,
                        width: 43,
                        decoration: BoxDecoration(
                            color: isDone ? kBlueColor : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: kBlueColor)),
                        child: Icon(
                          Icons.play_arrow,
                          color: isDone ? Colors.white : kBlueColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Session $sessionNum",
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ),
                ),
              ),
            )),
      );
    });
  }
}
