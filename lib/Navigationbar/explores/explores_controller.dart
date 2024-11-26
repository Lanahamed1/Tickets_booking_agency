import 'package:flutter_tickets_booking_agency/Navigationbar/explores/explores_model.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TripController extends GetxController {
  var trips = <Trip>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchTrips();
    super.onInit();
  }

  void fetchTrips() async {
    isLoading(true);
    try {
      final response = await http
          .get(Uri.parse('https://viawise.onrender.com/flight/explore/'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        trips.value =
            List<Trip>.from(jsonData.map((trip) => Trip.fromJson(trip)));
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
