import 'dart:convert';
import 'package:example/Network/Api/ApiConfig.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future otpLogin(String username, String password,) async {
    var requestHeaders = <String, String>{
      'Content-Type': 'application/json'
    };
    var url = Uri.https(Config.apiURL, Config.loginAPI);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );
    Map<String, dynamic> result = jsonDecode(response.body);
    //dynamic result = jsonDecode(response.body);
    return result;
  }


  static Future authenticateAPI(String username, String password,) async {
    var requestHeaders = <String, String>{
      'Content-Type': 'application/json'
    };
    var url = Uri.https(Config.apiURL, Config.authenticate);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );
    Map<String, dynamic> result = jsonDecode(response.body);
    //dynamic result = jsonDecode(response.body);
    return result;
  }

  static Future prodiotAPI() async {
    var requestHeaders = <String, String>{
      'Content-Type': 'application/json'
    };
    var url = Uri.http(Config.apiURL, Config.prodiot);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    Map<String, dynamic> result = jsonDecode(response.body);
    //dynamic result = jsonDecode(response.body);
    return result;
  }

  static Future prodiot2API() async {
    var requestHeaders = <String, String>{
      'Content-Type': 'application/json'
    };
    var url = Uri.http(Config.apiURL, Config.prodiot2);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    Map<String, dynamic> result = jsonDecode(response.body);
    //dynamic result = jsonDecode(response.body);
    return result;
  }

  static Future prodiotChartAPI() async {
    var requestHeaders = <String, String>{
      'Content-Type': 'application/json'
    };
    var url = Uri.http(Config.apiURL, Config.prodiotchart);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    List<dynamic> result = jsonDecode(response.body);
    //dynamic result = jsonDecode(response.body);
    return result;
  }

  static Future deviceListAPI() async {
    var requestHeaders = <String, String>{
      'Content-Type': 'application/json',
    };
    var url = Uri.https(Config.apiURL, Config.definedDevices);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "userid" : "D3E30B44-01F9-4480-B7CE-B2D4D2ECA5D7"
      }),
    );
  }

  static Future deviceAcceptAPI(int id, status) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.https(Config.apiURL, Config.deviceStatus);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode({
        "id" : id,
        "status" : status
      }),
    );
/**    var result = deviceListModelFromJson(response.body);
    deviceList = result;
    //  List<dynamic> result = jsonDecode(response.body);
    return result;*/
  }


}
