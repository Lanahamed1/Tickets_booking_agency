import 'package:flutter_tickets_booking_agency/Form/travel%20form_model.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/home/model.dart';
import 'package:flutter_tickets_booking_agency/token_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TravelController extends GetxController {
  var currentCountry = ''.obs;
  var budget = 0.0.obs;
  var preferredActivity = ''.obs;
  var travelPurpose = ''.obs;
  var preferredWeather = ''.obs;

  void setCurrentCountry(String value) {
    currentCountry.value = value;
  }

  void setBudget(double value) {
    budget.value = value;
  }

  void setPreferredActivity(String value) {
    preferredActivity.value = value;
  }

  void setTravelPurpose(String value) {
    travelPurpose.value = value;
  }

  void setPreferredWeather(String value) {
    preferredWeather.value = value;
  }

  Future<List<FlightRecommend>?> sendTravelPreferences() async {
    final Map<String, dynamic>? tokenMap = await TokenManager.getTokenMap();
    if (tokenMap == null) {
      throw Exception('Token not found. User is not authenticated.');
    }

    final String accessToken = tokenMap['access'].toString();
    final response = await http.post(
      Uri.parse(
          'https://viawise.onrender.com/flight/combined_recommendations/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        'current_city': currentCountry.value.isNotEmpty
            ? currentCountry.value
            : 'default_city',
        'budget': budget.value > 0 ? budget.value : 0.0,
        'preferred_activity': preferredActivity.value.isNotEmpty
            ? preferredActivity.value
            : 'default_activity',
        'travel_goal': travelPurpose.value.isNotEmpty
            ? travelPurpose.value
            : 'default_goal',
        'preferred_climate': preferredWeather.value.isNotEmpty
            ? preferredWeather.value
            : 'default_climate',
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      List<FlightRecommend> flightRecommendations = [];

      if (responseData is Map<String, dynamic>) {
        for (var key in [
          'recommendations1',
          'recommendations2',
          'recommendations3'
        ]) {
          if (responseData.containsKey(key)) {
            var recommendationsList = responseData[key] as List;
            flightRecommendations.addAll(recommendationsList
                .map((flight) => FlightRecommend.fromJson(flight))
                .toList());
          }
        }
      }

      if (flightRecommendations.isNotEmpty) {
        return flightRecommendations;
      } else {
        throw Exception('No valid recommendations found in the response');
      }
    } else {
      print('Failed response: ${response.statusCode} ${response.body}');
      throw Exception('Failed to send preferences: ${response.body}');
    }
  }
}
