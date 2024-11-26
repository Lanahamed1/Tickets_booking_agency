class RReservation {
  String passengerName;
  String nationalId;
  String currentAirport;
  String destinationAirport;
  DateTime departureDate;
  double price;
  DateTime? returnDepartureDate;
 String return_currentAirport;
  String return_destinationAirport;
  RReservation({
     required this.return_currentAirport,
    required this.return_destinationAirport,
    required this.passengerName,
    required this.nationalId,
    required this.currentAirport,
    required this.destinationAirport,
    required this.departureDate,
    required this.price,
    this.returnDepartureDate,
  });
}





  // factory Reservation.fromJson(Map<String, dynamic> json) {
  //   return Reservation(
  //     passengerName: json['passengerName'],
  //     nationalId: json['nationalId'],
  //     currentAirport: json['currentAirport'],
  //     destinationAirport: json['destinationAirport'],
  //     departureDate: DateTime.parse(json['departureDate']),
  //     arrivalDate: DateTime.parse(json['arrivalDate']),
  //     price: json['price'],
  //     isRoundTrip: json['isRoundTrip'],
  //     returnDepartureDate: json['returnDepartureDate'] != null
  //         ? DateTime.parse(json['returnDepartureDate'])
  //         : null,
  //     returnArrivalDate: json['returnArrivalDate'] != null
  //         ? DateTime.parse(json['returnArrivalDate'])
  //         : null,
  //   );
  // }

