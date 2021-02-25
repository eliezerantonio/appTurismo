import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data = [];

  void setData(newData) {
    data = newData;

    notifyListeners();
  }

  Future<bool> requestData() async {
    final res = await http.get('https://api.b7web.com.br/flutter1wb/');

    if (res.statusCode == 200) {
      //inserir dados em data
       setData(jsonDecode(res.body));
    
      return true;
    } else {
      return false;
    }
  }
}
