import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static Future<Map<String, dynamic>?> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    Map<String, dynamic> tokenMap = jsonDecode(token);
    return tokenMap;
  }

  static Future<Map<String, dynamic>?> getTokenMap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      Map<String, dynamic> tokenMap = jsonDecode(token);
      return tokenMap;
    }
    return null;
  }

  static Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  
}
