// hotel_controller.dart
import 'package:flutter_tickets_booking_agency/hotels/hotels_model%20.dart';
import 'package:get/get.dart';

class HotelController extends GetxController {
  var hotels = <Hotel>[
    Hotel(
        name: 'Kempinski Hotel Amman Jordan',
        image: 'images/anmol-seth-hDbCjHNdF48-unsplash.jpg',
        location: 'Amman City Center',
        rate: '9.7 Excellent',
        price: 142,
        rating: Rating(stars: 4.9),
        images: [
          'images/frames-for-your-heart-FqqiAvJejto-unsplash.jpg',
          'images/frames-for-your-heart-zSG-kd-L6vw-unsplash.jpg',
          'images/jp-holecka-3bDnvBSSbpI-unsplash.jpg',
          'images/lotus-design-n-print-g51F6-WYzyU-unsplash.jpg',
          'images/li-yang-a8iCZvtrHpQ-unsplash.jpg'
        ],
        description:
            'Resturant \nParking\n Room Service\n Swimming Pool\n Fitness Center ',
        details:
            'This hotel is located in Shmeisani, Amman’s central business district. It features a 24-hour gym, a spa and 3 restaurants. The rooms offer panoramic Amman city views. The modern rooms at the Kempinski Hotel Amman have a seating area, a pillow menu and a marble bathroom with luxury amenities. Some rooms include a separate living area, an LCD TV and access to the Executive Lounge. The Via Appia Restaurant serves Italian cuisine made from fresh ingredients. Kempinski Hotel Amman has a lively sports bar with a video game area. '),
    Hotel(
        name: 'Boudl Kwait Al Fahahil',
        image: 'images/hiurich-granja-zdMTiDsKigw-unsplash.jpg',
        location: 'Fahaheel',
        rate: '9.1 Excellent',
        price: 112,
        rating: Rating(stars: 4.8),
        images: ['images/lotus-design-n-print-x64WAw1TIcQ-unsplash.jpg'],
        description: 'dd',
        details: 'ss'),
    Hotel(
        name: 'Cairo World Trade Center Residences',
        image: 'images/bhumil-chheda-o1lALNEP2BQ-unsplash.jpg',
        location: 'Cairo',
        rate: '7.8 Good',
        price: 112,
        rating: Rating(stars: 4),
        images: ['images/tania-miron-Owj8hsAD9EU-unsplash.jpg'],
        description: 'aa',
        details: 'ss'),
  ].obs;
}
