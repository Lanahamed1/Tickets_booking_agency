class RTickets {
  String passengerName;
  String passengername;
  String nationalId;
  String currentAirport;
  String destinationAirport;
  DateTime departureDate;
  double price;
  final String trip_type;
  final String airline_name;
  final String duration;
  bool isRoundTrip;
  DateTime? returnDepartureDate;
  String passenger_class;
  RTickets({
    required this.passengerName,
    required this.passengername,
    required this.nationalId,
    required this.passenger_class,
    required this.currentAirport,
    required this.destinationAirport,
    required this.departureDate,
    required this.duration,
    required this.price,
    required this.trip_type,
    required this.isRoundTrip,
    this.returnDepartureDate,
    required this.airline_name,
  });
}
