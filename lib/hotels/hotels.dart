import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:flutter_tickets_booking_agency/hotels/hotels_controller.dart';
import 'package:flutter_tickets_booking_agency/hotels/hotels_details.dart';
import 'package:flutter_tickets_booking_agency/hotels/hotels_model%20.dart';
import 'package:get/get.dart';

class HotelsView extends StatelessWidget {
  final HotelController hotelController = Get.put(HotelController());

  HotelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels'),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
            itemCount: hotelController.hotels.length,
            itemBuilder: (context, index) {
              Hotel hotel = hotelController.hotels[index];
              return Center(
                  child: Card(
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset(
                      hotel.image,
                      // Replace with actual image URL
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    ListTile(
                      title: Text(
                        hotel.name,
                        style: Styles.headLineStyle31,
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text('${hotel.rate}'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('${hotel.location}')
                        ],
                      ),
                      onTap: () {
                        Get.to(() => HotelDetailsPage(hotel: hotel));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: List.generate(
                                hotel.rating.stars.round(),
                                (index) => const Icon(
                                      Icons.star,
                                      size: 19,
                                      color: Color.fromARGB(255, 255, 218, 11),
                                    )),
                          ),
                          Text(
                            "\$${hotel.price}",
                            style: Styles.headLineStyle22,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
            },
          )),
    );
  }
}
