import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Flight/flight_card.dart';
import 'package:flutter_tickets_booking_agency/Flight_search/search_flight_model.dart';
import 'package:flutter_tickets_booking_agency/RoundTrip/Rflight_card%20.dart';

class RFlights extends StatefulWidget {
  final List<RFlight> flights;

  RFlights({
    super.key,
    required this.flights,
  });

  @override
  State<RFlights> createState() => _FlightsState();
}

class _FlightsState extends State<RFlights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SizedBox(
          child: Container(
            margin: const EdgeInsets.only(top: 3),
            child: const Text(
              "Select flight",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color(0XFFE1EDFF),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return RFlightCard(
              outbound_flight: widget.flights[index].outbound_flight,
              airline: widget.flights[index].airline,
              departureTime: widget.flights[index].departureDate,
              departure: widget.flights[index].departure,
              destination: widget.flights[index].destination,
              price: widget.flights[index].price,
              duration: widget.flights[index].duration,
              returnTime: widget.flights[index].returndate,
              return_flight: widget.flights[index].return_flight,
              return_departure: widget.flights[index].return_departure,
              return_destination: widget.flights[index].return_destination,
              return_departureDate: widget.flights[index].return_departureDate,
              return_returndate: widget.flights[index].return_returndate,
              return_duration: widget.flights[index].return_duration,
            );
          },
          itemCount: widget.flights.length,
        ),
      ),
    );
  }
}
