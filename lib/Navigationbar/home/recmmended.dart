import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_tickets_booking_agency/Flight/flight_controller.dart';
import 'package:flutter_tickets_booking_agency/Flight/flight_details.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecommendedCard extends StatefulWidget {
  final int id;
  final double price;
  final String departure;
  final String destination;
  final String airline;
  final String duration;

  const RecommendedCard({
    Key? key,
    required this.id,
    required this.price,
    required this.destination,
    required this.departure,
    required this.duration,
    required this.airline,
  }) : super(key: key);

  @override
  _RecommendedCardState createState() => _RecommendedCardState();
}

class _RecommendedCardState extends State<RecommendedCard> {
  double _userRating = 3.0; // Default rating
  final RatingService _ratingService =
      RatingService(baseUrl: 'https://viawise.onrender.com');

  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  void _submitRating(double rating) {
    int integerRating = rating.round(); // Convert to integer
    _ratingService.sendRating(widget.id, integerRating).then((_) {
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
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.grey[100],
          boxShadow: const [
            BoxShadow(
              color: Colors.blueGrey,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: MaterialButton(
          onPressed: () {
            Get.to(
              () => FlightInfoScreen(id: widget.id),
            );
          },
          clipBehavior: Clip.antiAlias,
          elevation: 70,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  widget.airline,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 88, 139, 240),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        widget.departure,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 24, 142, 239),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        widget.destination,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 24, 142, 239),
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: <Widget>[
                    Icon(Icons.flight_takeoff_outlined,
                        size: 30, color: Color.fromARGB(255, 24, 142, 239)),
                    SizedBox(width: 10),
                    Expanded(
                        child: Text(
                      "-----------------------------------",
                      style:
                          TextStyle(color: Color.fromARGB(255, 24, 142, 239)),
                    )),
                    SizedBox(width: 10),
                    Icon(Icons.flight_land,
                        size: 30, color: Color.fromARGB(255, 24, 142, 239)),
                  ],
                ),
                Flexible(
                  child: Text(
                    'Departure date: ${widget.duration}',
                    style: const TextStyle(color: Colors.indigo, fontSize: 13),
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '${widget.price}\$',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0),
                // Rating bar
                RatingBar.builder(
                  initialRating: _userRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
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
                const SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0)),
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

