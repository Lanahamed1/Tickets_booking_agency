import 'dart:convert';
import 'package:flutter_tickets_booking_agency/Tickets/tickets.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Booking/Booking_controller.dart';
import 'package:flutter_tickets_booking_agency/Booking/Details/booking_details.dart';
import 'package:flutter_tickets_booking_agency/Booking/Details/details_controller.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/My_Booking/my_booking_controller.dart'
    as myBookingController;
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/my_booking_model.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/policy/modify.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/policy/modify_controller.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/policy/policy.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';

class BookingCard extends StatelessWidget {
  final Bookedflights flight;
  final myBookingController.FlightController controller =
      Get.put(myBookingController.FlightController(), permanent: true);
  final controllermodify Controller = Get.put(controllermodify());
  final ReservationController _controller = Get.put(ReservationController());

  BookingCard({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(flight.airline, style: Styles.headLineStyle33),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(" ${flight.departure}  ", style: Styles.headLineStyle13),
                Text("  ${flight.destination} ", style: Styles.headLineStyle13),
              ],
            ),
            const SizedBox(height: 15.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.flight_takeoff_rounded,
                    color: Color.fromARGB(255, 2, 146, 219), size: 22),
                Text(' - - - - - - - - - - - -   '),
                Icon(Icons.flight_land_rounded,
                    color: Color.fromARGB(255, 2, 146, 219), size: 22),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(flight.departureTime, style: Styles.headLineStyle13),
                Text(flight.duration, style: Styles.headLineStyle13),
              ],
            ),
            const SizedBox(height: 15.0),
            if (flight.trip_type == 'Round-Trip') ...[
              const SizedBox(height: 15.0),
              Text('Return Information:', style: Styles.headLineStyle13),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(" ${flight.returnDeparture}  ",
                      style: Styles.headLineStyle13),
                  Text("  ${flight.returnDestination} ",
                      style: Styles.headLineStyle13),
                ],
              ),
              const SizedBox(height: 15.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.flight_takeoff_rounded,
                      color: Color.fromARGB(255, 2, 146, 219), size: 22),
                  Text(' - - - - - - - - - - - -   '),
                  Icon(Icons.flight_land_rounded,
                      color: Color.fromARGB(255, 2, 146, 219), size: 22),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(flight.returnTime, style: Styles.headLineStyle13),
                ],
              ),
            ],
            const SizedBox(height: 20.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text(flight.passengerclass, style: Styles.headLineStyle13),
              Text(flight.trip_type, style: Styles.headLineStyle13),
            ]),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    if (flight.status == 'PPD') {
                      Get.dialog(AlertDialog(
                          title: const Text(
                            "You must pay to complete your reservation!",
                            style: TextStyle(
                                color: Color.fromARGB(255, 17, 17, 17),
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                "Payment",
                                style: Styles.headLineStyle31,
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () async {
                                await fetchBookings;
                              },
                            )
                          ]));
                    }
                  },
                  child: Text(
                    "${flight.status} ",
                    style: Styles.headLineStyle13.copyWith(
                      color:
                          flight.status == 'Posted' ? Colors.red : Colors.black,
                    ),
                  ),
                ),
                Text("${flight.price}\$", style: Styles.headLineStyle13),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: flight.status == 'Posted'
                      ? null
                      : () {
                            Get.to(() => const TicketScreen());
                        },
                  child: Text(
                    'show Tickets!',
                    style: Styles.headLineStyle28.copyWith(
                      color:
                          flight.status == 'Posted' ? Colors.grey : Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, 
              children: [
                if (flight.status != 'CNL')
                  MaterialButton(
                    color: const Color.fromARGB(255, 204, 64, 64),
                    minWidth: 30,
                    height: 30,
                    onPressed: () {
                      Get.to(() => Policy(id: flight.id));
                    },
                    child: Text('CANCEL', style: Styles.headLineStyle24),
                  ),
                const SizedBox(width: 25),
                MaterialButton(
                  color: const Color.fromARGB(255, 2, 146, 219),
                  minWidth: 30,
                  height: 30,
                  onPressed: () {
                    Get.defaultDialog(
                      middleText:
                          "Are you sure you can modify your booking? Knowing that a 10% increase will be added to the trip price",
                      middleTextStyle: Styles.headLineStyle13,
                      actions: [
                        TextButton(
                          onPressed: () async {
                            await Controller.fetchData(flight.id);
                            Get.to(() => ModifyFlights(id: flight.id));
                          },
                          child: Text(
                            'Yes',
                            style: Styles.headLineStyle26,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            'No',
                            style: Styles.headLineStyle26,
                          ),
                        ),
                      ],
                    );
                  },
                  child: Text('MODIFY', style: Styles.headLineStyle24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future fetchBookings(List<int> bookingIds) async {
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
    return jsonDecode(response.body);
  } else {
    print('Failed to fetch bookings: ${response.statusCode}');
    return null;
  }
}
