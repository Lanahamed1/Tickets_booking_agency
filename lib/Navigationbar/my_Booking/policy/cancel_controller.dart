import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CancelController extends GetxController {
  var isLoading = false.obs;

  Future<void> cancelBooking(String username, String password, int id) async {
    isLoading.value = true;
    final url =
        Uri.parse('https://viawise.onrender.com/booking/cancel_booking/');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
          "booking_id": id,
        }),
      );
      print(response);
      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Booking canceled successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Error',
          'Failed to cancel booking',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred while canceling the booking',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
