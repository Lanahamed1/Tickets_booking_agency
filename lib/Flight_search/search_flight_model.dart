import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Flight {
  final int id;
  final String departure;
  final String destination;
  final DateTime departureDate;
  final DateTime returndate;
  final double price;
  final String airline;
  final String duration;
  final String seatClass;

  Flight({
    required this.id,
    required this.departure,
    required this.destination,
    required this.departureDate,
    required this.returndate,
    required this.price,
    required this.airline,
    required this.duration,
    required this.seatClass,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      id: json['id'] ?? 0,
      departure: json['airportDeparture'] ?? '',
      destination: json['airportArrival'] ?? '',
      departureDate: json['departure_date'] != null
          ? DateTime.parse(json['departure_date'])
          : DateTime.now(),
      returndate: json['return_date'] != null
          ? DateTime.parse(json['return_date'])
          : DateTime.now(),
      price: json["price_flight"] != null
          ? double.parse(json["price_flight"].toString())
          : 0.0,
      airline: json['airline'] ?? "Cham Wings Airline",
      duration: json["duration"] ?? '',
      seatClass: json['seat_class'] ?? '',
    );
  }

  static Future<List<Flight>> fetchFlight({
    required String? departure,
    required String? destination,
    required String? departureDate,
    required String? passengerCount,
    required String? ticketClass,
  }) async {
    final response = await http.get(Uri.parse(
        'https://viawise.onrender.com/flight/search1/?airportDeparture=$departure&airportArrival=$destination&departure_date=$departureDate&passenger_Count=$passengerCount'));

    print('Request URL: ${response.request?.url}');
    print(response.body);
    print(response.statusCode);
    List<Flight> flights = [];

    if (response.statusCode == 200) {
      final flightsJson = jsonDecode(response.body);
      for (var flightJson in flightsJson["flights"]) {
        final Flight flight = Flight.fromJson(flightJson);
        flights.add(flight);
      }
      return flights;
    } else {
      throw Exception('Failed to load flight');
    }
  }
}

class RFlight {
  final int outbound_flight;
  final String departure;
  final String destination;
  final DateTime departureDate;
  final DateTime returndate;
  final double price;
  final String airline;
  final String duration;
  final String seatClass;
  final int return_flight;
  final String return_departure;
  final String return_destination;
  final DateTime return_departureDate;
  final DateTime return_returndate;
  final String return_duration;

  RFlight({
    required this.return_departure,
    required this.return_destination,
    required this.return_departureDate,
    required this.return_returndate,
    required this.return_duration,
    required this.outbound_flight,
    required this.departure,
    required this.destination,
    required this.departureDate,
    required this.returndate,
    required this.price,
    required this.airline,
    required this.duration,
    required this.seatClass,
    required this.return_flight,
  });

  factory RFlight.fromJson(Map<String, dynamic> json) {
    return RFlight(
      return_duration: '',
      // json["return_duration"] != null ? json["return_duration"] : '',
      return_returndate: json['return_date'] != null
          ? DateTime.parse(json['return_date'])
          : DateTime.now(),
      return_departureDate: json['departure_date_return'] != null
          ? DateTime.parse(json['departure_date_return'])
          : DateTime.now(),
      return_destination: json['airportDeparture_return'] != null
          ? json['airportDeparture_return']
          : '',
      return_departure: json['airportArrival_return'] != null
          ? json['airportArrival_return']
          : '',
      return_flight: json['return_id'] != null ? json['return_id'] : 0,
      outbound_flight:
          json['outbound_flight_id'] != null ? json['outbound_flight_id'] : 0,
      departure: json['airportDeparture_outbound'] != null
          ? json['airportDeparture_outbound']
          : '',
      destination: json['airportArrival_outbound'] != null
          ? json['airportArrival_outbound']
          : '',
      departureDate: json['departure_date_outbound'] != null
          ? DateTime.parse(json['departure_date_outbound'])
          : DateTime.now(),
      returndate: json['return_date'] != null
          ? DateTime.parse(json['return_date'])
          : DateTime.now(),
      price: json["price_flight_outbound"] != null
          ? double.parse(json["price_flight_outbound"].toString())
          : 0.0,
      airline: json['airline'] != null ? json['airline'] : "Syrian Airline",
      seatClass: json['seat_class'] != null ? json['seat_class'] : '',
      duration: '',
    );
  }

  static Future<List<RFlight>> fetchFlight({
    required String? departure,
    required String? destination,
    required String? departureDate,
    // required String? passengerCount,
    // required String? ticketClass,
    required String? endDate,
  }) async {
    final response = await http.get(Uri.parse(
        'https://viawise.onrender.com/flight/search2/?airportDeparture=$departure&airportArrival=$destination&departure_date=$departureDate&return_date=$endDate'));

    print('Request URL: ${response.request?.url}');

    print(response.body);
    print(response.statusCode);
    List<RFlight> flights = [];

    if (response.statusCode == 200) {
      final flightsJson = jsonDecode(response.body);
      for (var flightJson in flightsJson["flights"]) {
        final RFlight flight = RFlight.fromJson(flightJson);
        flights.add(flight);
      }
      return flights;
    } else {
      throw Exception('Failed to load flight');
    }
  }
}
