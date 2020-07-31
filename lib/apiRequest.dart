import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiRequest with ChangeNotifier{
   var data;
   Future getData() async{
  var d = await http.get("https://sigmatenant.ml/mobile/tags");
  data = jsonDecode(d.body);

  return data;
}
}