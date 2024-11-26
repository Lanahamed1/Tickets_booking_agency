import 'dart:convert';

class RflightModel {
  final int return_flight;
  final String return_departure;
  final String return_destination;
  final DateTime return_departureDate;
  final DateTime return_returndate;
  final int outbound_flight;
  final double price;
  final String destination;
  final String departure;
  final DateTime departureTime;
  final String airline;
  final String duration;
  final int rate;
  final String notes;

  RflightModel({
    required this.return_flight,
    required this.notes,
    required this.return_departure,
    required this.return_destination,
    required this.return_departureDate,
    required this.return_returndate,
    required this.outbound_flight,
    required this.price,
    required this.departureTime,
    required this.destination,
    required this.departure,
    required this.duration,
    required this.airline,
    required this.rate,
  });

  factory RflightModel.fromJson(Map<String, dynamic> json) {
    return RflightModel(
      return_returndate: json['return_date'] != null
          ? DateTime.parse(json['return_date'])
          : DateTime.now(),
      return_departureDate: json['departure_date_return'] != null
          ? DateTime.parse(json['departure_date_return'])
          : DateTime.now(),
      return_destination: json['airportDeparture_return'] ?? '',
      return_departure: json['airportArrival_return'] ?? '',
      return_flight: json['return_id'] ?? 0,
      outbound_flight: json['outbound_flight_id'] ?? 0,
      notes: json['notes_outbound'] ?? '',
      rate: json['ratings_outbound'] ?? 0,
      departureTime: DateTime.parse(json['departure_date_outbound']),
      departure: json['airportDeparture_outbound'] ?? '',
      destination: json['airportArrival_outbound'] ?? '',
      price: (json['price_flight_outbound'] is String)
          ? double.parse(json['price_flight_outbound'])
          : json['price_flight_outbound'].toDouble(),
      airline: json['airline_name'] ?? '',
      duration: '1h 2min',
    );
  }
}
