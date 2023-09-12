import 'package:example/Screens/ChartScreen.dart';
import 'package:example/Utils/colors.dart';
import 'package:example/Widgets/DeviceCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


class DevicePage extends StatefulWidget {
  const DevicePage({
    Key? key,
  }) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<DevicePage> {
  int tab = 0;
  bool ispopup = false;


  late int counter = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryPrimaryColor,
      appBar: AppBar(
        title: const Text('Aygıtlar'),
        centerTitle: true,
 /*       leading: IconButton(
          icon:
          const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),*/
        backgroundColor: primaryColor,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverFixedExtentList(
                    delegate: SliverChildListDelegate.fixed([Container()]),
                    itemExtent: MediaQuery.of(context).size.height * 0.0),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.78,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: 22,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                          child: CardWidget(
                            color: const Color(0xfffafafa),
                            button: true,
                            border: Border(
                              left: BorderSide(
                                width: 7, color: primaryColor
                              )
                            ),
                            func: () {
                              ChartPage().launch(context, isNewTask: false, pageRouteAnimation: PageRouteAnimation.Slide);
                            },
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.13,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                               //       width: MediaQuery.of(context).size.width * 0.75,
                                      //     color: Colors.cyan,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Arduino Uno R3',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w700, fontSize: 14),
                                                maxLines: 1,
                                              ),
                                              Text(
                                                '23.01.2023',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black54),
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Kullanılıyor',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black54),
                                                maxLines: 1,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Text(
                                                  "Kritik",
                                                  style: const TextStyle(
                                                      fontFamily: 'Red Hat Display',
                                                      color: cancel_booking),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Divider(
                                            thickness: 1,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                child: Icon(Icons.check_circle, color: primaryColor.withOpacity(0.9),),
                                                onTap: () {},
                                              ),
                                              SizedBox(width: 10,),
                                              GestureDetector(
                                                child: Icon(Icons.cancel, color: primaryColor.withOpacity(0.9),),
                                                onTap: () {},
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
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}