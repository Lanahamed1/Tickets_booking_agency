import 'dart:convert';
import 'package:flutter_tickets_booking_agency/Booking/Booking_model.dart';
import 'package:flutter_tickets_booking_agency/Flight_search/search_flight_controller.dart';
import 'package:flutter_tickets_booking_agency/RoundTrip/booking_details.dart';
import 'package:flutter_tickets_booking_agency/token_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class RBookingController extends GetxController {
  var passengersCount = 1.obs;
  final int maxPassengers = 3;
  var passengers = List.generate(
    5,
    (index) => Passenger(
      firstName: '',
      lastName: '',
      dateOfBirth: null,
      nationalNumber: '',
      gender: 'Ms',
    ),
  ).obs;

  var bookingIds = <int>[].obs; // Observable list to store booking IDs

  // Instance of FlightSearchController to access selectSeatClass
  final FlightSearchController flightSearchController =
      Get.find<FlightSearchController>();

  void updatePassengersCount(int count) {
    passengersCount.value = count;
  }

  void updateFirstName(int index, String value) {
    passengers[index].firstName = value;
  }

  void updateLastName(int index, String value) {
    passengers[index].lastName = value;
  }

  void updateDateOfBirth(int index, String value) {
    if (value == null || value.isEmpty) {
      passengers[index].dateOfBirth = null;
      return;
    }

    DateTime? parsedDate;

    // Try parsing in "dd/MM/yyyy" format
    try {
      parsedDate = DateFormat("dd/MM/yyyy").parseStrict(value);
    } catch (e) {
      // Parsing in "dd/MM/yyyy" format failed, try "yyyy-MM-dd HH:mm:ss.SSS" format
      try {
        parsedDate = DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parseStrict(value);
      } catch (e) {
        print("Invalid date format: $value");
      }
    }

    if (parsedDate != null) {
      passengers[index].dateOfBirth = parsedDate;
    }
  }

  void updateNationalNumber(int index, String value) {
    passengers[index].nationalNumber = value;
  }

  void updateGender(int index, String value) {
    passengers[index].gender = value;
  }

  void validateFormAndNavigate() {
    // Your implementation goes here
  }

  Future<void> submitBooking(int return_flight, int outbound_flight) async {
    final Map<String, dynamic>? tokenMap = await TokenManager.getTokenMap();
    if (tokenMap == null) {
      throw Exception('Token not found. User is not authenticated.');
    }

    final String accessToken = tokenMap['access'].toString();
    final url = Uri.parse('https://viawise.onrender.com/booking/make_booking/');

    final passengerList = passengers
        .where((passenger) =>
            passenger.firstName.isNotEmpty &&
            passenger.lastName.isNotEmpty &&
            passenger.dateOfBirth != null &&
            passenger.nationalNumber.isNotEmpty &&
            passenger.gender.isNotEmpty)
        .map((passenger) => {
              "first_name": passenger.firstName,
              "last_name": passenger.lastName,
              "date_of_birth":
                  DateFormat('yyyy-MM-dd').format(passenger.dateOfBirth!),
              "passport_number": passenger.nationalNumber,
              "gender": passenger.gender,
            })
        .toList();

    if (passengerList.isEmpty) {
      throw Exception('No passenger data provided.');
    }

    final bookingDetails = {
      "trip_type": "RT",
      "passenger_class": flightSearchController.selectSeatClass,
      "outbound_flight": outbound_flight.toString(),
       "return_flight": return_flight.toString(),
      "passenger": passengerList,
     
    };

    try {
      final encodedBookingDetails = jsonEncode(bookingDetails);
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: encodedBookingDetails,
      );
print(encodedBookingDetails);
      if (response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        print("Booking successful: $responseBody"); // Debugging info

        if (responseBody.containsKey('booking_ids')) {
          List<int> newBookingIds = List<int>.from(responseBody['booking_ids']);
          print("booking_ids: $newBookingIds");

          bookingIds.assignAll(newBookingIds);
          print("Assigned Booking IDs: $bookingIds");

          // Navigate to ReservationView with bookingIds
          Get.to(() => RReservationView(newBookingIds: newBookingIds));
        } else {
          print("Error: 'booking_id' not found in response body.");
        }
      } else {
        print("Failed to book: Status code ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
