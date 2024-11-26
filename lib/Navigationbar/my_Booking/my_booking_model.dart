class Bookedflights {
  final int id;
  final String price;
  final String destination;
  final String departure;
  final String departureTime;
  final String airline;
  final String passengerclass;
  final String status;
  final String trip_type;
  final String returnTime;
  final String returnDeparture;
  final String returnDestination;
  final String duration;

  Bookedflights({
    required this.id,
    required this.price,
    required this.destination,
    required this.departure,
    required this.departureTime,
    required this.airline,
    required this.passengerclass,
    required this.status,
    required this.trip_type,
    required this.returnTime,
    required this.returnDeparture,
    required this.returnDestination,
    required this.duration,
  });
}


class User {
  final String password;
  final String username;
  User({required this.username, required this.password});
}

class PolicyModel {
  String policyText;

  PolicyModel({required this.policyText});
}
