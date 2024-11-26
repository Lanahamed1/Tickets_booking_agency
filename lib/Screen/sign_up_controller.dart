import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Form/form.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/Main_page.dart';
import 'package:flutter_tickets_booking_agency/Screen/Auth.dart';
import 'package:flutter_tickets_booking_agency/Screen/user_model.dart';

class SignUpController {
  void signUp(BuildContext context, UserModel userModel) async {
    try {
      var result = await Auth.SignUp(
        userModel.firstName,
        userModel.lastName,
        userModel.username,
        userModel.password,
      );

      if (result == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Signed Up successfully!"),
          ),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) {
            return TravelView();
          }),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to sign up. Please try again."),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("user with this username already exists."),
        ),
      );
    }
  }
}
