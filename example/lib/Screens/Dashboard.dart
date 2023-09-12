
import 'dart:async';
import 'dart:convert';

import 'package:example/Network/Api/ApiService.dart';
import 'package:example/Screens/ChartScreen.dart';
import 'package:example/Screens/DeviceScreen.dart';
import 'package:example/Utils/colors.dart';
import 'package:example/Utils/common.dart';
import 'package:example/Utils/images.dart';
import 'package:example/Widgets/CategoryCard.dart';
import 'package:example/Widgets/DeviceCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:nb_utils/nb_utils.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key,}) : super(key: key);

  @override
  State<DashboardPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DashboardPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryPrimaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('PRODIOT'),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 10,
      ),
      //  bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          /*        Container(
            // Here the height of the container is 45% of our total height
            height: MediaQuery.of(context).size.height * .20,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)
              ),
              image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: const AssetImage(
                      appLogo),
                  colorFilter: ColorFilter.mode(
                    Colors.grey.withOpacity(0.3),
                    BlendMode.modulate,
                  )),
            ),
          ),*/
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      //  color: primaryColor.withOpacity(0.5)
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            width: MediaQuery.of(context).size.width * 0.75,
                            //     color: Colors.cyan,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'AYŞE YILMAZ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700, fontSize: 18),
                                          maxLines: 1,
                                        ),
                                        Text(
                                          'Yazılım Mühendisi',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300, fontSize: 18),
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: appTextSecondaryColor,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 1.22,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: [
                          CategoryCard(
                            title: 'Anasayfa',
                            svgSrc: 'assets/images/home.png',
                            press: () {  },
                            color: cardColor,
                          ),
                          CategoryCard(
                            title: 'Çevresel İzleme',
                            svgSrc: 'assets/images/heat.png',
                            press: () {  },
                            color: cardColor,
                          ),
                          CategoryCard(
                              title: 'İç Hava Kalitesi',
                              svgSrc: 'assets/images/air-purifier.png',
                              press: () {  },
                              color: cardColor,
                          ),
                          CategoryCard(
                            title: 'EV şarj istasyonu',
                            svgSrc: 'assets/images/charging-station.png',
                            press: () {  },
                            color: cardColor,
                          ),
                          CategoryCard(
                            title: 'Sensörler',
                            svgSrc: 'assets/images/signal-range.png',
                            press: () {  },
                            color: cardColor,
                          ),
                        ],
                      ),
                    )
                  ),
                  Divider(
                    thickness: 2,
                    color: appTextSecondaryColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}