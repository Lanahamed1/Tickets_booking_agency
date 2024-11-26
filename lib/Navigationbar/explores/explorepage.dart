import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/explores/explores_controller.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';

class ExplorePage extends StatelessWidget {
  final TripController tripController = Get.put(TripController());

  ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Highest rated', style: Styles.headLineStyle23),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Obx(() {
        if (tripController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (tripController.trips.isEmpty) {
          return Center(child: Text('No trips found'));
        }
        return ListView.builder(
          itemCount: tripController.trips.length,
          itemBuilder: (context, index) {
            var trip = tripController.trips[index];
            String imagePath =
                getImageForTrip(index); // اختيار الصورة بناءً على الفهرس
            return MaterialButton(
              onPressed: () {},
              child: Card(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(trip.country, style: Styles.headLineStyle20),
                          const SizedBox(height: 5),
                          Text(
                            trip.description,
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: List.generate(
                              trip.rating.round(),
                              (index) => const Icon(
                                Icons.star,
                                size: 15,
                                color: Color.fromARGB(255, 255, 218, 11),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  // دالة لاختيار الصورة بناءً على الفهرس أو أي معيار آخر
  String getImageForTrip(int index) {
    List<String> images = [
      'images/Amman.jpg',
      'images/Russia.jpg',
      'images/evangelos-mpikakis-y3uAtNQFIYg-unsplash.jpg',
    ];

    return images[index % images.length];
  }
}
