import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Booking/Details/details_model.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:intl/intl.dart';

class ReservationCard extends StatelessWidget {
  final Reservation reservation;

  ReservationCard({required this.reservation});
  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Passenger', style: Styles.headLineStyle33),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text("Departure:", style: Styles.headLineStyle30),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(reservation.passengerName, style: Styles.headLineStyle31),
                Text(reservation.nationalId, style: Styles.headLineStyle31),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(reservation.currentAirport, style: Styles.headLineStyle31),
                Text(reservation.destinationAirport,
                    style: Styles.headLineStyle31),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.flight_takeoff_rounded,
                  color: Color(0xFF1765FC),
                ),
                Text(' - - - - - - - - - - - -   '),
                Icon(
                  Icons.flight_land_rounded,
                  color: Color(0xFF1765FC),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(formatDate(reservation.departureDate).toString(),
                    style: Styles.headLineStyle31),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${reservation.price}\$', style: Styles.headLineStyle30),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
