import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness/view/login/controller/login_provider.dart';
import 'package:fitness/view/login/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/colo_extension.dart';
import '../../common_widget/round_button.dart';

class WhatYourGoalView extends StatefulWidget {
  const WhatYourGoalView({super.key});

  @override
  State<WhatYourGoalView> createState() => _WhatYourGoalViewState();
}

class _WhatYourGoalViewState extends State<WhatYourGoalView> {
  CarouselController buttonCarouselController = CarouselController();



  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                  CarouselSlider(
                items: ref.watch(goalIndexProvider.notifier).goalArr
                    .map(
                      (gObj) => Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: TColor.primaryG,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: media.width * 0.1, horizontal: 25),
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Column(
                            children: [
                              Image.asset(
                                gObj["image"].toString(),
                                width: media.width * 0.5,
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(
                                height: media.width * 0.1,
                              ),
                              Text(
                                gObj["title"].toString(),
                                style: TextStyle(
                                    color: TColor.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                width: media.width * 0.1,
                                height: 1,
                                color: TColor.white,
                              ),
                              SizedBox(
                                height: media.width * 0.02,
                              ),
                              Text(
                                gObj["subtitle"].toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: TColor.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  onPageChanged: (index, _) {
                    print(index);
                    ref.read(goalIndexProvider.notifier).state = index;
                  },
                  viewportFraction: 0.7,
                  aspectRatio: 0.74,
                  initialPage: 0,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: media.width,
            child: Column(
              children: [
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "What is your goal ?",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "It will help us to choose a best\nprogram for you",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.grey, fontSize: 12),
                ),
                const Spacer(),
                SizedBox(height: media.width * 0.05),
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) =>
                          RoundButton(
                              title: "Confirm",
                              onPressed: () {
                                print(ref.read(goalIndexProvider));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const WelcomeView()));
                              }),
                ),
                SizedBox(height: media.width * 0.05),
              ],
            ),
          )
        ],
      )),
    );
  }
}
