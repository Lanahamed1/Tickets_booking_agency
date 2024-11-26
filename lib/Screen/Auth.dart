import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_tickets_booking_agency/token_manager.dart';

class Auth {
  static Future<bool> SignUp(String first_name, String last_name,
      String username, String password) async {
    final url = Uri.parse("https://viawise.onrender.com/account/register/");

    {
      final response = await http.post(
        url,
        body: {
          'first_name': first_name,
          'last_name': last_name,
          'username': username,
          'password': password,
        },
      );
      print(response.body);
      if (response.statusCode == 201) {
        return true;
      } else {
        print('Token not found in response body.');
        return false;
      }
    }
  }

  static Future<bool> LogIN(String username, String password) async {
    final url = Uri.parse("https://viawise.onrender.com/account/login/");

    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      String token = response.body;
      await TokenManager.saveToken(token);

      print(' token $token');

      return true;
    } else {
      return false;
    }
  }
}
