import 'dart:convert';
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/policy/modify_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class controllermodify extends GetxController {
  final isLoading = true.obs;
  final isError = false.obs;
  final modify = <ModifyModel>[].obs;

  Future<void> fetchData(int id) async {
    final url = 'https://viawise.onrender.com/flight/similar_flights/100';

    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        modify.clear();
        jsonData.forEach((data) {
          modify.add(ModifyModel(
            id: data['id'],
            price: data['price_flight'] != null
                ? double.parse(data['price_flight'])
                : 0.0,
            destination: data['airportArrival'] ?? 'Damascus',
            departure: data['airportDeparture'] ?? 'berit',
            departureTime: data['departure_date'] ?? '20024/2/2',
            airline: data['airline_name'] ?? 'cham wings',
            duration: data['duration'] ?? '1h 3min',
            arrivalTime: data['departure_date'] ?? 'Unknown',
          ));
        });

        // Update UI
        isLoading(false);
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        // Set error state
        isError(true);
      }
    } catch (e) {
      print('Exception while fetching data: $e');
      // Set error state
      isError(true);
    }
  }

  void sendPostRequest(int id) async {
    id.toString();
    final url =
        Uri.parse('https://viawise.onrender.com/booking/modify_booking/$id');

    // Headers
    final headers = {
      'Content-Type': 'application/json',
    };

    // Body
    final body = jsonEncode({
      "outbound_flight_id": id,
    });

    // Sending the request
    final response = await http.patch(url,
        headers: headers, body: body.isEmpty ? null : body);

    if (response.statusCode == 200) {
      print('Request was successful!');
      print('Response: ${response.body}');
    } else {
      print('Request failed with status code ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }
}
