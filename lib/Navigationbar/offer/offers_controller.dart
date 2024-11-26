import 'package:flutter_tickets_booking_agency/Navigationbar/offer/offers_model.dart';
import 'package:get/get.dart';

class OfferController extends GetxController {
  var offers = <OfferModel>[
    OfferModel(
      departure: 'Damascus',
      destination: 'Dubai',
      departureDate: '2024-6-15',
      returnDate: '7:00PM',
      id: 1,
      image: "images/Dubi.jpg",
      rate: Rating(stars: 4.9),
      airline: ' Syrian Airlines',
      amount: 35,
      durationoffer: '2 days ',
      price: 290,
    ),
    OfferModel(
      image: "images/Russia.jpg",
      departure: 'Lattakia',
      rate: Rating(stars: 4),
      destination: 'Moscow',
      departureDate: '2024-11-15',
      returnDate: '2022-11-25',
      id: 2,
      airline: 'Cham Wings Airlines',
      amount: 20,
      durationoffer: '1 days',
      price: 280,
    ),
    OfferModel(
      image: "images/Amman.jpg",
      departure: 'Damascus',
      rate: Rating(stars: 3.5),
      destination: 'Muscat',
      departureDate: '2024-7-2',
      returnDate: '2022-11-25',
      id: 3,
      airline: 'Syrian Airlines',
      amount: 50,
      durationoffer: '17hours',
      price: 230,
    ),
    OfferModel(
      image: "images/Damascus.jpg",
      departure: 'Erbil',
      rate: Rating(stars: 3.9),
      destination: 'Aleppo',
      departureDate: '2024-7-23',
      returnDate: '2022-11-25',
      id: 4,
      airline: 'Cham Wings Airlines',
      amount: 30,
      durationoffer: '3 days',
      price: 250,
    ),
  ].obs;
  var totalPoints = 100.obs;
  final String TextPoints = 'Earn more points by booking more flights!';
}
