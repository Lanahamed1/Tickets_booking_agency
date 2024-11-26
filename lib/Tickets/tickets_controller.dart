import 'package:flutter_tickets_booking_agency/Tickets/tickects_model.dart';
import 'package:get/get.dart';

class TicketController extends GetxController {
  var ticket = TicketModel(
          from: "DAM",
          to: "KWI",
          duration: "8H 30M",
          date: "6 june",
          departureTime: "08:00 AM",
          passengerName: "Lana hamed",
          passportNumber: "899911111",
          price: "\$1000.99",
          airline: 'Syria Airlines',
          seattype: 'Economy',
          isRoundTrip: false, 
          trip_type: 'OW',
          returnDepartureDate: '12 JUNE')
      .obs;
}
