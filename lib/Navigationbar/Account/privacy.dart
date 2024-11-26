import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/app_layot.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: AppLayout.getWidth(900),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/airline.jpg",
                      fit: BoxFit.cover,
                      height: AppLayout.getHeight(250),
                      width: AppLayout.getWidth(550),
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                          top: 9,
                        ),
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(Icons.arrow_back),
                              color: Colors.white,
                              iconSize: 17,
                            ),
                            const Text("Privacy Policy",
                                style: TextStyle(
                                    letterSpacing: 0.4,
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800)),
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: AppLayout.getHeight(28),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "Thank you (viawise) for travel services. Please read order cancellation and modification carefully before placing your order: ",
                        style: Styles.headLineStyle31,
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(13),
                      ),
                      Text(
                        "Cancel: \n - A week before the flight date: If the reservation is canceled a week before the flight date, 20% of the ticket value will be deducted as a cancellation fee. \n - Within a week of flights: If you cancel your reservation within a week of flights, 30% of the ticket value will be deducted as a cancellation fee. ",
                        style: Styles.headLineStyle31,
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(13),
                      ),
                      Text(
                        "Modify: \n - Amendment: If it is necessary in your request (to change flights, route, or traveler information), 10% of the ticket value will be added as an amendment fee to the ticket.",
                        style: Styles.headLineStyle31,
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(13),
                      ),
                      Text(
                        "Comments: \n - Additional fees may be applied by airlines or other services, which are not your responsibility.\n - Please contact us as soon as possible to cancel or request your modification. \n - Cancellation and modification cancellation will apply regardless of cancellation or creation cancellation.",
                        style: Styles.headLineStyle31,
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(20),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Thank you for your cooperation ",
                              style: Styles.headLineStyle38,
                            ),
                            Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.grey.shade500,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
