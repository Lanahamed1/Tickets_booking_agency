import 'package:flutter_tickets_booking_agency/Flight/flight_model.dart';
import 'package:flutter_tickets_booking_agency/RoundTrip/flight_model%20.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RFlightController {
  static Future<RflightModel> fetchFlightById(
      int return_flight, int outbound_flight) async {
    final response = await http.get(Uri.parse(
        'https://viawise.onrender.com/flight/flight_details/$return_flight/$outbound_flight'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return RflightModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load flight');
    }
  }
}
