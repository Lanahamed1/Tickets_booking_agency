import 'dart:convert';

class flightModel {
  final int id;
  final double price;
  final String destination;
  final String departure;
  final DateTime departureTime;
  final String airline;
  final String duration;
  final int rate;
  final String notes;

  flightModel({
    required this.notes,
    required this.id,
    required this.price,
    required this.departureTime,
    required this.destination,
    required this.departure,
    required this.duration,
    required this.airline,
    required this.rate,
  });

  factory flightModel.fromJson(Map<String, dynamic> json) {
    return flightModel(
      id: json['id'],
      notes: json['notes'],
      rate: json['ratings'],
      departureTime: DateTime.parse(json['departure_date']),
      departure: json['airportDeparture'],
      destination: json['airportArrival'],
      // departureCity: json['departure_city'],
      // destinationCity: json['destination_city'],
      // departureCountry: json['departure_country'],
      // destinationCountry: json['destination_country'],
      price: double.parse(json['price_flight']),
      airline: json['airline_name'],
      duration: '',
    );
  }
  
}
