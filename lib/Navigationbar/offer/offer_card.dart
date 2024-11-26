// offer_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/offer/offers_model.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';

class OfferCard extends StatelessWidget {
  final OfferModel offer;

  const OfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
        child: Image.asset(
          offer.image,
          height: 130,
          width: 90,
          fit: BoxFit.cover,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          "${offer.airline}",
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "From: ${offer.departure}",
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
              ),
              Text("  To: ${offer.destination}",
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14))
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("   ${offer.departureDate}", style: Styles.headLineStyle29)
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 9,
              ),
              Text('\$${offer.price} ',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.lineThrough,
                  )),
              const Icon(
                Icons.discount_rounded,
                color: Colors.green,
                size: 12,
              ),
              Text(
                  '  discount ${offer.amount}% \n  for ${offer.durationoffer}  ',
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.w600))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: List.generate(
                  offer.rate.stars.round(),
                  (index) => const Icon(
                        size: 19,
                        Icons.star,
                        color: Color.fromARGB(255, 255, 218, 11),
                      )),
            ),
          ),
          const Row(
            children: [
              SizedBox(
                height: 15,
              )
            ],
          ),
          Divider(
            color: Colors.grey[200],
          ),
        ],
      ),
    );
  }
}
