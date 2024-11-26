// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/policy/modify_controller.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/policy/modify_model.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';

class ModifyCard extends StatelessWidget {
  final controllermodify Controller = Get.put(controllermodify());

  final ModifyModel flights;

  ModifyCard({
    super.key,
    required this.flights,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(
            left: 20.0, right: 20.0, bottom: 20.0, top: 20),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ]),
            child: MaterialButton(
              onPressed: () {
                Controller.sendPostRequest(flights.id);
              },
              clipBehavior: Clip.antiAlias,
              elevation: 90,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30.0, bottom: 30.0, left: 35.0, right: 35.0),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text(flights.airline, style: Styles.headLineStyle33)
                    ]),
                    const SizedBox(height: 13.0),
                    Text(
                      ' ${flights.departure}',
                      style: Styles.headLineStyle27,
                    ),
                    Text(
                      flights.destination,
                      style: Styles.headLineStyle27,
                    ),
                    const SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            ' ${flights.departureTime}',
                            style: Styles.headLineStyle13,
                          ),
                          Text(
                            '${flights.arrivalTime} ',
                            style: Styles.headLineStyle13,
                          ),
                        ]),
                    const SizedBox(height: 15.0),
                    const Row(
                      children: <Widget>[
                        Icon(Icons.flight_takeoff_rounded,
                            color: Color.fromARGB(255, 2, 146, 219), size: 22),
                        Text(' - - - - - - - - - - - - - - - - -  '),
                        Icon(Icons.flight_land_rounded,
                            color: Color.fromARGB(255, 2, 146, 219), size: 22),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '${flights.duration}',
                          style: Styles.headLineStyle13,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Text(
                          '${flights.price}\$',
                          style: Styles.headLineStyle30,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
