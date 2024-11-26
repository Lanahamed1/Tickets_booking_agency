
import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Flight_search/search_flight.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/home/model.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/home/recmmended.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:flutter_tickets_booking_agency/hotels/hotels.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  final List<FlightRecommend> flightRecommendations;

  const Homepage({Key? key, required this.flightRecommendations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(80))),
                    child: Image.asset(
                      "images/photo.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  //   Container(
                  //   padding: const EdgeInsets.all(10),
                  ////   child: Text(
                  //     "ViaWise",
                  //    style: Styles.headLineStyle14,
                  //   ),
                  // ),
                  Container(
                    margin: const EdgeInsets.only(top: 200), //تصغير المسافة
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            width: 120,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                              color: Colors.grey[100],
                            ),
                            child: Column(
                              children: [
                                MaterialButton(
                                  height: 40,
                                  onPressed: () {
                                    Get.to(() => FlightSearch());
                                  },
                                  child: const Icon(
                                    Icons.flight_takeoff_outlined,
                                    color: Color.fromARGB(255, 2, 146, 219),
                                    size: 35,
                                  ),
                                ),
                                Text(
                                  "Flights",
                                  textAlign: TextAlign.center,
                                  style: Styles.headLineStyle13,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          width: 120,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            shape: BoxShape.rectangle,
                            color: Colors.grey[100],
                          ),
                          child: Flexible(
                            child: Column(
                              children: [
                                MaterialButton(
                                  height: 40,
                                  onPressed: () {
                                    Get.to(() => HotelsView());
                                  },
                                  child: const Icon(
                                    Icons.bed,
                                    color: Color.fromARGB(255, 2, 146, 219),
                                    size: 35,
                                  ),
                                ),
                                Text(
                                  "Hotel",
                                  textAlign: TextAlign.center,
                                  style: Styles.headLineStyle13,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Recommended for you",
                        style: Styles.headLineStyle2,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: flightRecommendations.length,
                itemBuilder: (context, index) {
                  return RecommendedCard(
                    id: flightRecommendations[index].id,
                    airline: flightRecommendations[index].airline,
                    departure: flightRecommendations[index].departure,
                    destination: flightRecommendations[index].destination,
                    price: flightRecommendations[index].price,
                    duration: flightRecommendations[index].duration,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
