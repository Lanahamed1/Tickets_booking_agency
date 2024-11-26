import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Form/travel%20form_controller.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/explores/explorepage.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/explores/explores_controller.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/Account/account.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/My_Booking/my_booking.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/home/homepage.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/offer/offer_page.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/offer/offers_controller.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/My_Booking/my_booking_controller.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/home/model.dart';

class Mainpage extends StatefulWidget {
  final List<FlightRecommend>? flightRecommendations;

  Mainpage({super.key, this.flightRecommendations});

  @override
  State<Mainpage> createState() => _Mainpage();
}

class _Mainpage extends State<Mainpage> {
  final FlightController flightController = Get.put(FlightController());
  final OfferController offerController = Get.put(OfferController());
  final TravelController travelController = Get.put(TravelController());
  final TripController tripController = Get.put(TripController());

  List<FlightRecommend> flightRecommendations = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.flightRecommendations != null) {
      flightRecommendations = widget.flightRecommendations!;
    } else {
      _fetchRecommendations();
    }
  }

  Future<void> _fetchRecommendations() async {
    final recommendations = await travelController.sendTravelPreferences();
    if (recommendations != null) {
      setState(() {
        flightRecommendations = recommendations;
      });
    }
  }

  List<Widget> pages = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pages = [
      Homepage(flightRecommendations: flightRecommendations),
      ExplorePage(),
      Offers(),
      MyBooking(),
      Account(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GNav(
          rippleColor: Colors.grey[300]!,
          gap: 8,
          activeColor: const Color.fromARGB(255, 2, 146, 219),
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: Colors.grey[300]!,
          color: Colors.grey,
          onTabChange: (value) {
            setState(() {
              currentIndex = value;
              if (currentIndex == 0) {
                _fetchRecommendations();
              }
              if (currentIndex == 1) {
                tripController.fetchTrips();
              }
              if (currentIndex == 2) {
                offerController.offers();
              }
              if (currentIndex == 3) {
                flightController.fetchBookedFlights(); // Fetch flights when "My Booking" tab is selected
              }
            });
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.search,
              text: "Explore",
            ),
            GButton(
              icon: Icons.discount,
              text: "Offers",
            ),
            GButton(
              icon: Icons.luggage,
              text: "My Booking",
            ),
            GButton(
              icon: Icons.person,
              text: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
