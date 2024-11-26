class TicketModel {
  final String from;
  final String to;
  final String duration;
  final String date;
  final String departureTime;
  final String passengerName;
  final String passportNumber;
  final String airline;
  final String seattype;
  final String price;
  final String trip_type;
  bool isRoundTrip;
  String? returnDepartureDate;

  TicketModel({
    required this.from,
    required this.to,
    required this.duration,
    required this.airline,
    required this.seattype,
    required this.date,
    required this.departureTime,
    required this.passengerName,
    required this.passportNumber,
    required this.trip_type,
    required this.isRoundTrip,
    this.returnDepartureDate,
    required this.price,
  });
}
