import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/My_Booking/my_booking_controller.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/BookingCard.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';

class MyBooking extends StatelessWidget {
  final FlightController flightController = Get.put(FlightController());

  MyBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0XFFE1EDFF),
        title: Text(
          'My Booking',
          style: Styles.headLineStyle23,
        ),
      ),
      body: Obx(() {
        if (flightController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (flightController.hasError.value) {
          return Center(child: Text('Error fetching data'));
        } else if (flightController.flights.isEmpty) {
          return Center(child: Text('No bookings found.'));
        } else {
          return ListView.builder(
            itemCount: flightController.flights.length,
            itemBuilder: (context, index) {
              return BookingCard(flight: flightController.flights[index]);
            },
          );
        }
      }),
    );
  }
}
