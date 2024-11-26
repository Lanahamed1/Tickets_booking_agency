import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_tickets_booking_agency/Navigationbar/Account/contact_model.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  var contactMessage = ContactMessage().obs;

  bool get isValid =>
      contactMessage.value.name != null &&
      contactMessage.value.email != null &&
      contactMessage.value.message != null;

  Future<void> sendMessage() async {
    final url = Uri.parse(
        'https://viawise.onrender.com/account/contact_us/'); // Replace with your API endpoint
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(contactMessage.value.toJson()),
    );

    if (response.statusCode == 201) {
      // Handle successful response
      Get.snackbar('Success', 'Message sent successfully');
    } else {
      // Handle error response
      Get.snackbar('Error', 'Failed to send message');
    }
  }
}

class ProfileController {
  Future<void> saveProfile({
    required String token,
    required String firstName,
    required String lastName,
    required String email,
    required String age,
    required String address,
    required String gender,
    required String maritalStatus,
    required String occupation,
  }) async {
    final profileData = {
      'first_name': firstName,
      'last_name': lastName,
      'username': email,
      'age': age,
      'address': address,
      'gender': gender,
      'marital_status': maritalStatus,
      'occupation': occupation,
    };

    // Print the request body
    print('Request Body: $profileData');

    final url = Uri.parse('https://viawise.onrender.com/account/profile/');

    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(profileData),
    );

    if (response.statusCode == 200) {
      print('Profile updated');
    } else {
      print('Failed to update profile: ${response.body}');
      print(response.statusCode);
    }
  }
}
