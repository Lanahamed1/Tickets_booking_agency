import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Booking/Booking.dart';
import 'package:flutter_tickets_booking_agency/Flight/flight_model.dart';
import 'package:flutter_tickets_booking_agency/Flight_search/search_flight_controller.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'flight_controller.dart';

class FlightInfoScreen extends StatelessWidget {
  FlightSearchController controller = Get.put(FlightSearchController());
  final int id;

  FlightInfoScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FlightController.fetchFlightById(id),
        builder: (context, AsyncSnapshot<flightModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final flight = snapshot.data!;
            return Scaffold(
                backgroundColor: const Color(0XFFE1EDFF),
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  centerTitle: true,
                  elevation: 0.0,
                  title: SizedBox(
                    child: Container(
                        margin: const EdgeInsets.only(top: 3),
                        child: Text("Flight details",
                            style: Styles.headLineStyle23)),
                  ),
                ),
                body: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 25, left: 20, right: 20, bottom: 25),
                    child: Container(
                      padding: const EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 181, 184, 185),
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(children: <Widget>[
                        Row(children: <Widget>[
                          Text(
                            flight.airline,
                            style: Styles.headLineStyle21,
                          ),
                        ]),
                        const SizedBox(height: 15.0),
                        const Row(
                          children: [
                            Text("Departure",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w800)),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "From : ${flight.departure}",
                              style: Styles.headLineStyle13,
                            ),
                            Text(
                              "To : ${flight.destination}",
                              style: Styles.headLineStyle13,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Time: ${flight.departureTime}',
                                style: Styles.headLineStyle13,
                              ),
                              Text(
                                'Duration: ${flight.duration}',
                                style: Styles.headLineStyle13,
                              ),
                            ]),
                        const SizedBox(height: 20.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Type : Transit",
                                style: Styles.headLineStyle13,
                              ),
                              Text(
                                textAlign: TextAlign.end,
                                'Price : \$${flight.price}',
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600),
                              ),
                            ]),
                        const SizedBox(height: 20.0),
                        const Divider(
                          color: Color.fromARGB(255, 181, 184, 185),
                          thickness: 0.5,
                        ),
                        const SizedBox(height: 5.0),
                        const Divider(
                          color: Color.fromARGB(255, 181, 184, 185),
                          thickness: 0.5,
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text('Notes : ${flight.notes}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      letterSpacing: 0.4,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w800)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            children: List.generate(
                                flight.rate.round(),
                                (index) => const Icon(
                                      size: 15,
                                      Icons.star,
                                      color: Color.fromARGB(255, 255, 218, 11),
                                    )),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 49),
                          width: 400,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade600,
                            borderRadius: BorderRadius.circular(150),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Get.to(() => Booking(id: flight.id));
                            },
                            child: Text("Continue",
                                textAlign: TextAlign.right,
                                style: Styles.headLineStyle32),
                          ),
                        ),
                      ]),
                    ),
                  )
                ]));
          }
        });
  }
}
