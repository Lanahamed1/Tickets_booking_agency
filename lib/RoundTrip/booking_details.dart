import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Booking/Booking_controller.dart';
import 'package:flutter_tickets_booking_agency/Booking/Details/reservation_card.dart';
import 'package:flutter_tickets_booking_agency/Booking/Details/details_controller.dart';
import 'package:flutter_tickets_booking_agency/Booking/Details/details_model.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/Main_page.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/my_booking.dart';
import 'package:flutter_tickets_booking_agency/RoundTrip/Booking_controller.dart';
import 'package:flutter_tickets_booking_agency/RoundTrip/details_controller.dart';
import 'package:flutter_tickets_booking_agency/RoundTrip/details_model.dart';
import 'package:flutter_tickets_booking_agency/RoundTrip/reservation_card.dart';
import 'package:flutter_tickets_booking_agency/RoundTrip/tickets.dart';
import 'package:flutter_tickets_booking_agency/Tickets/tickets.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';

class RReservationView extends StatelessWidget {
  final RBookingController _Controller = Get.put(RBookingController());

  final RReservationController _controller = Get.put(RReservationController());
  final List<int> newBookingIds;

  RReservationView({super.key, required this.newBookingIds});

  @override
  Widget build(BuildContext context) {
    _controller.rsendReservation(_Controller.bookingIds); // Initiate data fetch

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          "Booking details",
          style: TextStyle(
            color: Color.fromARGB(255, 2, 146, 219),
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

       

        return NestedScrollView(
          headerSliverBuilder: (context, _) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    border: Border.all(color: Colors.blue, width: 1),
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 0, right: 3, left: 7),
                        child: Icon(
                          Icons.info_sharp,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "If you are sure of the information, press on\n Continue",
                          style:
                              TextStyle(color: Color.fromARGB(255, 23, 22, 22)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _controller.reservations.length,
                  itemBuilder: (context, index) {
                    RReservation reservation = _controller.reservations[index];
                    return RReservationCard(reservation: reservation);
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 49),
                    width: 200,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 2, 146, 219),
                      borderRadius: BorderRadius.circular(250),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Get.dialog(
                          AlertDialog(
                            title: Text(
                              "Do you want to pay?",
                              style: Styles.headLineStyle23,
                              textAlign: TextAlign.center,
                            ),
                            actions: <Widget>[
                              TextButton(
                                  child: Text(
                                    "Yes",
                                    style: Styles.headLineStyle31,
                                  ),
                                  onPressed: () async {
                                    var bookings = await fetchBookings(
                                        _Controller.bookingIds);
                                    if (bookings != null) {
                                      // Handle successful booking fetch
                                      print(
                                          'Bookings fetched successfully: $bookings');
                                    } else {
                                      print('Failed to fetch bookings');
                                    }
                                    await Get.to(() => RTicketScreen(
                                        bookingIds: _Controller.bookingIds));
                                  }),
                              const SizedBox(width: 50),
                              TextButton(
                                child: Text(
                                  "Later",
                                  style: Styles.headLineStyle31,
                                ),
                                onPressed: () {
                                  Get.to(() => Mainpage()); // Close dialog
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text(
                        "Pyment",
                        style: TextStyle(
                          letterSpacing: 0.2,
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      }),
    );
  }
}
