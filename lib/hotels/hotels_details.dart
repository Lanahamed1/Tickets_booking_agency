// hotel_details_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:flutter_tickets_booking_agency/hotels/hotels_model%20.dart';

class HotelDetailsPage extends StatelessWidget {
  final Hotel hotel;

  HotelDetailsPage({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        hotel.name,
        style: Styles.headLineStyle27,
      )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: hotel.images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Image.asset(
                  hotel.images[index],
                  height: 700,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    children: List.generate(
                        hotel.rating.stars.round(),
                        (index) => const Icon(
                              Icons.star,
                              size: 19,
                              color: Color.fromARGB(255, 255, 218, 11),
                            ))),
                const SizedBox(
                  height: 10,
                ),
                Text(hotel.location),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Amenities",
                  style: Styles.headLineStyle27,
                ),
                Text(hotel.description),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Details",
                  style: Styles.headLineStyle27,
                ),
                Text(hotel.details)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
