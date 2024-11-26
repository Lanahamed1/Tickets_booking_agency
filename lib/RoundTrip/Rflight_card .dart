import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_tickets_booking_agency/Flight/flight_controller.dart';
import 'package:flutter_tickets_booking_agency/Flight/flight_details.dart';
import 'package:flutter_tickets_booking_agency/RoundTrip/flight_details.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RFlightCard extends StatefulWidget {
  final int return_flight;
  final int outbound_flight;
  final double price;
  final String destination;
  final String departure;
  final DateTime departureTime;
  final String airline;
  final String duration;
  final DateTime returnTime;
  final String return_departure;
  final String return_destination;
  final DateTime return_departureDate;
  final DateTime return_returndate;
  final String return_duration;

  RFlightCard({
    required this.outbound_flight,
    required this.return_flight,
    required this.price,
    required this.departureTime,
    required this.destination,
    required this.departure,
    required this.duration,
    required this.airline,
    required this.returnTime,
    required this.return_departure,
    required this.return_destination,
    required this.return_departureDate,
    required this.return_returndate,
    required this.return_duration,
  });

  @override
  _RFlightCardState createState() => _RFlightCardState();
}

class _RFlightCardState extends State<RFlightCard> {
  double _userRating = 3.0; // Default rating
  final RatingService _ratingService =
      RatingService(baseUrl: 'https://viawise.onrender.com');

  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  void _submitRating(double rating) {
    int integerRating = rating.round(); // Convert to integer
    _ratingService.sendRating(widget.outbound_flight, integerRating).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Rating submitted successfully')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit rating')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
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
          ],
        ),
        child: MaterialButton(
          onPressed: () {
            Get.to(
              () => RFlightInfoScreen(
                return_flight: widget.return_flight,
                outbound_flight: widget.outbound_flight,
              ),
            );
          },
          clipBehavior: Clip.antiAlias,
          elevation: 90,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 30.0, bottom: 30.0, left: 0, right: 35.0),
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Text(
                    widget.airline,
                    style: const TextStyle(
                        color: Color(0xFF1765FC),
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                ]),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.departure),
                    Text(widget.return_destination)
                  ],
                ),
                const SizedBox(height: 29.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(formatDate(widget.departureTime)),
                      Text(formatDate(widget.returnTime)),
                    ]),
                const SizedBox(height: 20.0),
                Container(
                  child: const Row(
                    children: <Widget>[
                      Icon(Icons.blur_on, color: Color(0xFF1765FC)),
                      Text('- - - - - - - - - - - '),
                      Icon(Icons.airplane_ticket_outlined,
                          color: Color(0xFF1765FC)),
                      Text('- - - - - - - - - - - '),
                      Icon(Icons.blur_on, color: Color(0xFF1765FC)),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.duration),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(widget.return_departure),
                    Text(widget.destination)
                  ],
                ),
                const SizedBox(height: 29.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(formatDate(widget.return_departureDate)),
                      Text(formatDate(widget.return_returndate)),
                    ]),
                const SizedBox(height: 20.0),
                Container(
                  child: const Row(
                    children: <Widget>[
                      Icon(Icons.blur_on, color: Color(0xFF1765FC)),
                      Text('- - - - - - - - - - - '),
                      Icon(Icons.airplane_ticket_outlined,
                          color: Color(0xFF1765FC)),
                      Text('- - - - - - - - - - - '),
                      Icon(Icons.blur_on, color: Color(0xFF1765FC)),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.duration),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 0, left: 200, right: 0),
                      child: Text(
                        '${widget.price}\$',
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
                RatingBar.builder(
                  initialRating: _userRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _userRating = rating;
                    });
                    _submitRating(rating);
                  },
                ),
                const SizedBox(height: 5.0),
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
        ),
      ),
    );
  }
}
