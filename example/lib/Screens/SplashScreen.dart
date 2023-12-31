import 'dart:async';

import 'package:example/Screens/DashboardJson.dart';
import 'package:example/Screens/LoginScren.dart';
import 'package:example/Utils/common.dart';
import 'package:example/Utils/constant.dart';
import 'package:example/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  late SharedPreferences localdata;
  bool? islogin;

  void init() async {
    localdata = await SharedPreferences.getInstance();
    islogin = (localdata.getBool('login') ?? false);
    print(islogin);
    if (islogin ?? false) {
      await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardWidget()));
    }
    else {
      await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }


  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => init());
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              //     color: colors.secondcolor,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter:
                      ColorFilter.mode(Colors.black.withOpacity(0.2),
                          BlendMode.dstATop),
                      image: const ExactAssetImage(backgroundImg),
                      fit: BoxFit.fitHeight
                  )
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 50.0,
                          child: Image.asset(
                            appLogo, height: 100,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text(
                            mAppName,
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  spinkit,
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}