
import 'dart:async';
import 'dart:convert';

import 'package:example/Network/Api/ApiService.dart';
import 'package:example/Screens/ChartScreen.dart';
import 'package:example/Screens/DeviceScreen.dart';
import 'package:example/Utils/colors.dart';
import 'package:example/Utils/common.dart';
import 'package:example/Utils/images.dart';
import 'package:example/Widgets/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:nb_utils/nb_utils.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key,}) : super(key: key);

  @override
  State<DashboardWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DashboardWidget> {

  Map widgetsData = {
    "type": "scaffold",
    "args":{
      "body":{
        "type": "center",
        "child": {
          "type": "circular_progress_indicator"
        }
      }
    }
  };
 late Map widgetsData2 = {
    "type": "scaffold",
    "args":{
      "body":{
        "type": "center",
        "child": {
          "type": "circular_progress_indicator"
        }
      }
    }
  };

  var registry = JsonWidgetRegistry.instance;

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 5), () => APIService.prodiotAPI().then((value) {
      setState(() {
        widgetsData=value;
      });
    }));

    Timer(Duration(seconds: 5), () => APIService.prodiot2API().then((value) {
      setState(() {
        widgetsData2=value;
      });
    }));

    var widget = JsonWidgetData.fromDynamic(widgetsData,registry: registry);
    var imageWidget = JsonWidgetData.fromDynamic(widgetsData2,registry: registry);

    return Scaffold(
      backgroundColor: secondaryPrimaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('PRODIOT'),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
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
                        color: primaryColor.withOpacity(0.5)
                    ),
                    child: Row(
                      children: [
                        imageWidget!.build(context: context),
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
      /*            const SizedBox(
                    height: 30,
                  ),*/
                  Expanded(
                    child: widget!.build(context: context),
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