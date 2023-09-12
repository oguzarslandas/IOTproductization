import 'dart:async';
import 'dart:convert';

import 'package:example/Network/Api/ApiService.dart';
import 'package:example/Utils/colors.dart';
import 'package:example/Utils/common.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChartPage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ChartPage> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  @override
  void initState() {
    super.initState();
    loadSalesData();
  }

  Future loadSalesData() async {
    await APIService.prodiotChartAPI().then((dynamic result) {
      for (Map<String, dynamic> i in result) {
        data.add(_SalesData.fromJson(i));
      }
    });
  }

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.78865208734527, 34.52063338725983),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryPrimaryColor,
        appBar: AppBar(
          title: const Text('Chart'),
          centerTitle: true,
          backgroundColor: primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            //Initialize the chart widget
            Container(
              margin: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.25,
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: CustomStyle.cardBoxDecoration,
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
             //     title: ChartTitle(text: 'Yıllık Satış Analizi'),
                  // Enable legend
                  legend: Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, String>>[
                    LineSeries<_SalesData, String>(
                        dataSource: data,
                        xValueMapper: (_SalesData sales, _) => sales.year,
                        yValueMapper: (_SalesData sales, _) => sales.sales,
                        name: 'Sıcaklık',
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ]),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(vertical: 15),
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: CustomStyle.cardBoxDecoration,
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis:
                      NumericAxis(minimum: 0, maximum: 100, interval: 10),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, String>>[
                    ColumnSeries<_SalesData, String>(
                        dataSource: data,
                        xValueMapper: (_SalesData data, _) => data.year,
                        yValueMapper: (_SalesData data, _) => data.sales,
                        name: 'Satış',
                        color: Color.fromRGBO(8, 142, 255, 1))
                  ]),
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(7),
              height: MediaQuery.of(context).size.height * 0.30,
              decoration: CustomStyle.cardBoxDecoration,
              child: Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.terrain,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                  Center( //picker image on google map
                    child: Image.asset('assets/images/wifi.png', width: 50,),
                  ),
                ]
              ),
            ),
          ]),
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  factory _SalesData.fromJson(Map<String, dynamic> parsedJson) {
    return _SalesData(
      parsedJson['year'].toString(),
      parsedJson['sales'],
    );
  }

  final String year;
  final double sales;
}
