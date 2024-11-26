import 'dart:convert';
import 'package:flutter_tickets_booking_agency/RoundTrip/details_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tickets_booking_agency/Booking/Details/details_model.dart';
import 'package:get/get.dart';

class RReservationController extends GetxController {
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var reservations = <RReservation>[].obs;

  Future<void> rsendReservation(List<int> newBookingIds) async {
    final bookingIds = newBookingIds.join('');
    final url = Uri.parse(
        'https://viawise.onrender.com/booking/booking_details/$bookingIds');

    try {
      isLoading.value = true;

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(response.body);

        if (responseData.containsKey('outbound_flight') &&
            responseData.containsKey('Passenger') &&
            responseData.containsKey('return_flight')) {
          final reservationJson = responseData;

          final reservation = RReservation(
            passengerName: reservationJson['Passenger']['first_name'],
            nationalId: reservationJson['Passenger']['passport_number'],
            currentAirport: reservationJson['outbound_flight']
                ['airportDeparture'],
            destinationAirport: reservationJson['outbound_flight']
                ['airportArrival'],
            departureDate: DateTime.parse(
                reservationJson['outbound_flight']['departure_date']),
            price: double.parse(reservationJson['total_cost']),
            returnDepartureDate: reservationJson['return_flight'] != null
                ? DateTime.parse(
                    reservationJson['return_flight']['departure_date'])
                : null,
            return_currentAirport: reservationJson['return_flight'] != null
                ? reservationJson['return_flight']['airportDeparture']
                : null,
            return_destinationAirport: reservationJson['return_flight'] != null
                ? reservationJson['return_flight']['airportArrival']
                : null,
          );

          // Update reservations list with the single reservation
          reservations.assignAll([reservation]);

          print('Reservation sent successfully');
        } else {
          print('No reservations data found in the response');
          errorMessage.value = 'No reservations data found in the response';
        }
      } else {
        print('Failed to send reservation: ${response.statusCode}');
        errorMessage.value =
            'Failed to send reservation: ${response.statusCode}';
      }
    } catch (e) {
      print('Error occurred while sending reservation: $e');
      errorMessage.value = 'Error occurred while sending reservation: $e';
    } finally {
      isLoading.value = false;
    }
  }
}

Future rfetchBookings(List<int> newBookingIds) async {
  var url = Uri.parse('https://viawise.onrender.com/booking/make_payment/');

  // Convert list of IDs to a JSON string
  var requestBody = jsonEncode({'booking_ids': newBookingIds});

  var response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: requestBody,
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print('Failed to fetch bookings: ${response.statusCode}');
    return null;
  }
}
