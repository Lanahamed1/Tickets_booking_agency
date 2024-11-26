import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/my_booking_model.dart';
import 'package:flutter_tickets_booking_agency/token_manager.dart';
import 'package:get/get.dart';

class FlightController extends GetxController {
  var isLoading = true.obs;
  var hasError = false.obs;
  var flights = <Bookedflights>[].obs;

  @override
  void onInit() {
    fetchBookedFlights(); // Call fetchBookedFlights here
    super.onInit();
  }

  Future<void> fetchBookedFlights() async {
    String url = 'https://viawise.onrender.com/booking/My-booking/';

    try {
      Map<String, dynamic>? token = await TokenManager.getTokenMap();
      if (token == null) {
        throw Exception('Token not found. User is not authenticated.');
      }

      final accessToken = token['access'].toString();

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );
      print(response);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Bookedflights> bookedFlights = data.map((flightData) {
          return Bookedflights(
            id: flightData['id'] ?? 0,
            price: flightData['total_cost']?.toString() ?? '0.0',
            destination: flightData['outbound_flight']?['airportArrival'] ?? '',
            departure: flightData['outbound_flight']?['airportDeparture'] ?? '',
            departureTime: flightData['booking_date'] ?? '',
            airline: flightData['outbound_flight']?['airline_name'] ?? '',
            passengerclass: flightData['passenger_class'] ?? '',
            status: flightData['status'] ?? '',
            trip_type: flightData['trip_type'] ?? '',
            returnTime: flightData['arrival_time']?['arrival_time'] ?? '',
            returnDeparture:
                flightData['departure_airport']?['departure_airport'] ?? '',
            returnDestination:
                flightData['destination_airport']?['destination_airport'] ?? '',
            duration: flightData['duration'] ?? '',
          );
        }).toList();

        flights.assignAll(bookedFlights);
        print(response.body);
        isLoading(false); // Set isLoading to false once data is loaded
      } else {
        throw Exception('Failed to load booked flights: ${response.body}');
      }
    } catch (error) {
      print('Error fetching booked flights: $error');
      isLoading(false); // Set isLoading to false in case of error
      hasError(true);
      throw Exception('Failed to load booked flights: $error');
    }
  }
}
