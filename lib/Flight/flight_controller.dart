import 'package:flutter_tickets_booking_agency/Flight/flight_model.dart';
import 'package:flutter_tickets_booking_agency/token_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FlightController {
  static Future<flightModel> fetchFlightById(int id) async {
    final response = await http.get(
        Uri.parse('https://viawise.onrender.com/flight/flight_details/$id'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return flightModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load flight');
    }
  }
}

class RatingService {
  final String baseUrl;

  RatingService({required this.baseUrl});

  Future<void> sendRating(int id, int rating) async {
    final Map<String, dynamic>? tokenMap = await TokenManager.getTokenMap();
    if (tokenMap == null) {
      throw Exception('Token not found. User is not authenticated.');
    }

    final String accessToken = tokenMap['access'].toString();
    final url = Uri.parse('$baseUrl/flight/$id/reviews');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: json.encode({'ratings': rating, "comment": "very good"}),
    );

    if (response.statusCode == 200) {
      print('Rating submitted successfully');
    } else {
      print('Failed to submit rating: ${response.statusCode}');
    }
  }
}
