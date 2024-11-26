
import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/offer/offer_card.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/offer/offers_controller.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/offer/offers_model.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  final OfferController offerController = Get.put(OfferController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offers', style: Styles.headLineStyle23),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Points',
                        style: Styles.headLineStyle23,
                      ),
                      SizedBox(height: 10),
                      Obx(() => Text(
                            'Total Points: ${offerController.totalPoints.value}',
                            style: Styles.headLineStyle19,
                          )),
                      SizedBox(height: 20),
                      Text(
                        offerController.TextPoints,
                        style: Styles.headLineStyle31,
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.shopify_sharp,
              color: Colors.green,
            ),
            iconSize: 30,
            alignment: Alignment.centerRight,
          ),
        ],
        backgroundColor: const Color(0XFFE1EDFF),
      ),
      body: Obx(() => ListView.builder(
            itemCount: offerController.offers.length,
            itemBuilder: (context, index) {
              OfferModel offer = offerController.offers[index];
              return OfferCard(offer: offer);
            },
          )),
    );
  }
}
