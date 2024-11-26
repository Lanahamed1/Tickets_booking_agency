import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Form/form.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/Main_page.dart';
import 'package:flutter_tickets_booking_agency/Screen/Auth.dart';
import 'package:flutter_tickets_booking_agency/Screen/user_model.dart';
import 'package:get/get.dart';

class LoginController {
  void signIn(BuildContext context, User user) async {
    var result = await Auth.LogIN(user.username, user.password);

    if (result == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Signed in successfully!"),
        ),
      );
      // Navigate to the main page on successful sign in
      await {(Get.off(() => TravelView()),)};
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error: Invalid username or password!"),
        ),
      );
    }
  }
}
