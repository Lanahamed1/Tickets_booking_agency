import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'tickects_model.dart';

class RTicketController extends GetxController {
  var ticket = RTickets(
    passengerName: '',
    nationalId: '',
    currentAirport: '',
    destinationAirport: '',
    departureDate: DateTime.now(),
    duration: '',
    price: 0.0,
    trip_type: '',
    isRoundTrip: false,
    airline_name: '',
    passengername: '',
    passenger_class: '',
  ).obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  Future<void> rfetchTicketDetails(List<int> bookingIds) async {
    // Construct the URL with query parameters
    final bookingIdsString = bookingIds.join(',');
    final url = Uri.parse(
        'http://viawise.onrender.com/booking/tickets/$bookingIdsString');

    try {
      isLoading.value = true;

      final response = await http.get(
        url,
        headers: {
          'Content-Type':
              'application/json', // Typically, Content-Type would be application/json for JSON data
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData != null &&
            responseData.containsKey('Passenger') &&
            responseData.containsKey('outbound_flight')
            ) {
          final ticketJson = responseData;

          final ticket = RTickets(
            passengerName: ticketJson['Passenger']['first_name'],
            passengername: ticketJson['Passenger']['last_name'],
            nationalId: ticketJson['Passenger']['passport_number'] ?? '',
            currentAirport:
                ticketJson['outbound_flight']['airportDeparture'] ?? '',
            destinationAirport:
                ticketJson['outbound_flight']['airportArrival'] ?? '',
            departureDate: DateTime.parse(ticketJson['outbound_flight']
                    ['departure_date'] ??
                DateTime.now().toString()),
            price: double.tryParse(ticketJson['total_cost'].toString()) ?? 0.0,
            passenger_class: ticketJson['passenger_class'],
            isRoundTrip: ticketJson['outbound_flight'] != true,
            returnDepartureDate: ticketJson['outbound_flight'] != null
                ? DateTime.parse(ticketJson['outbound_flight']
                        ['departure_city_return'] ??
                    DateTime.now().toString())
                : null,
            duration: ticketJson['outbound_flight']['duration'] ?? '',
            airline_name: ticketJson['outbound_flight']['Airplane']
                ['airline_name'],
            trip_type: ticketJson['trip_type'] ?? '',
          );

          this.ticket.value = ticket;
          print('Ticket details fetched successfully');
        } else {
          print('No ticket data found in the response');
          errorMessage.value = 'No ticket data found in the response';
        }
      } else {
        print('Failed to fetch ticket details: ${response.statusCode}');
        errorMessage.value =
            'Failed to fetch ticket details: ${response.statusCode}';
      }
    } catch (e) {
      print('Error occurred while fetching ticket details: $e');
      errorMessage.value = 'Error occurred while fetching ticket details: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
