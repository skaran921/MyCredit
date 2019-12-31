import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ok_credit/utils/my_credit.dart';

class LoginProvider {
  // **********************************createAccount ***************************
  Future createAccount(
      {firstName, lastName, email, mobileNumber, password}) async {
    try {
      var response = await http.post(
          "${MyCredit.baseApiURL}${MyCredit.creatAccountApiParam}",
          body: {
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "mobileNumber": mobileNumber,
            "password": password
          });

      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } on HttpException {
      return {"result": "Network_Problem"};
    } on SocketException {
      return {"result": "Network_Problem"};
    } catch (error) {
      return {"result": "Error"};
    }
  }
  // **********************************createAccount ***************************

  // **********************************checkLoginAuthentication ***************************
  Future checkLoginAuthentication({mobileNumber, password}) async {
    try {
      var response = await http.post(
          "${MyCredit.baseApiURL}${MyCredit.loginApiParam}",
          body: {"mobileNumber": mobileNumber, "password": password});

      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } on HttpException {
      return {"result": "Network_Problem"};
    } on SocketException {
      return {"result": "Network_Problem"};
    } catch (error) {
      return {"result": "Error"};
    }
  }
  // **********************************checkLoginAuthentication ***************************
}
