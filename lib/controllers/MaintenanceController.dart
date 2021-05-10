import 'dart:convert';

import 'package:Boilerplate/api/api_util.dart';
import 'package:Boilerplate/models/MyResponse.dart';
import 'package:Boilerplate/utils/InternetUtils.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

class MaintenanceController {
  //------------------------ Checking maintenance  -----------------------------------------//
  static Future<MyResponse> checkMaintenance() async {
    String maintenanceUrl = ApiUtil.MAIN_API_URL + ApiUtil.MAINTENANCE;

    //Check Internet
    bool isConnected = await InternetUtils.checkConnection();
    if (!isConnected) {
      return MyResponse.makeInternetConnectionError();
    }

    try {
      Response response = await http.get(maintenanceUrl,
          headers: ApiUtil.getHeader(requestType: RequestType.Post));

      MyResponse myResponse = MyResponse(response.statusCode);

      if (response.statusCode == 200) {
        myResponse.success = true;
      } else {
        Map<String, dynamic> data = json.decode(response.body);
        myResponse.success = false;
        myResponse.setError(data);
      }
      return myResponse;
    } catch (e) {
      //If any server error...
      return MyResponse.makeServerProblemError();
    }
  }
}
