import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_tickets_booking_agency/Booking/Details/details_model.dart';
import 'package:get/get.dart';

class ReservationController extends GetxController {
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var reservations = <Reservation>[].obs;

  Future<void> sendReservation(List<int> newBookingIds) async {
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
            responseData.containsKey('Passenger')) {
          final reservationJson = responseData;

          final reservation = Reservation(
            passengerName: reservationJson['Passenger']['first_name'],
            nationalId: reservationJson['Passenger']['passport_number'],
            currentAirport: reservationJson['outbound_flight']
                ['airportDeparture'],
            destinationAirport: reservationJson['outbound_flight']
                ['airportArrival'],
            departureDate: DateTime.parse(
                reservationJson['outbound_flight']['departure_date']),
            price: double.parse(reservationJson['total_cost']),
          );

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

Future<bool >fetchBookings(List<int> bookingIds) async {
  var url = Uri.parse('https://viawise.onrender.com/booking/make_payment/');
  var requestBody = jsonEncode({'booking_ids': bookingIds});

  var response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: requestBody,
  );
  print(requestBody);
  print(url);
  if (response.statusCode == 201) {
    return true;
  } else {
    print('Failed to fetch bookings: ${response.statusCode}');
    return false;
  }
}














//   Future<void> fetchReservations(List<String> bookingIds) async {
//     try {
//       isLoading(true);

//       //  Encode the request body with the booking IDs
//       // String requestBody = json.encode({'booking_id': 46});
//       // print('Request Body: $requestBody'); // Print the request body

//       var response = await http.post(
//         Uri.parse('https://viawise.onrender.com/booking/booking_details/46'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         // body: requestBody, // Use the encoded request body
//       );

//       print(
//           'Response Status Code: ${response.statusCode}'); // Print the response status code

//       if (response.statusCode == 200) {
//         var jsonData = json.decode(response.body) as List;
//         reservations.value = jsonData
//             .map((reservationJson) => Reservation.fromJson(reservationJson))
//             .toList();
          
//       } else {
//         errorMessage.value = 'Failed to load reservations';
//       }
//     } catch (e) {
//       errorMessage.value = e.toString();
//     } finally {
//       isLoading(false);
//     }
//   }
// }
  









//   Future<void> fetchReservations(List<String> bookingIds) async {
//     try {
//       isLoading(true);

//       // Encode the request body with the booking IDs
//       String requestBody = json.encode({'booking_id': 39});
//       print('Request Body: $requestBody'); // Print the request body

//       var response = await http.post(
//         Uri.parse('https://viawise.onrender.com/booking/make_payment/'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: requestBody, // Use the encoded request body
//       );

//       print(
//           'Response Status Code: ${response.statusCode}'); // Print the response status code

//       if (response.statusCode == 200) {
//         var jsonData = json.decode(response.body) as List;
//         reservations.value = jsonData
//             .map((reservationJson) => Reservation.fromJson(reservationJson))
//             .toList();
//       } else {
//         errorMessage.value = 'Failed to load reservations';
//       }
//     } catch (e) {
//       errorMessage.value = e.toString();
//     } finally {
//       isLoading(false);
//     }
//   }
// }
