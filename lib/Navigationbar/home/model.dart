class FlightRecommend {
  final int id;
  final double price;
  final String departure;
  final String destination;
  final String airline;
  final String duration;

  FlightRecommend({
    required this.id,
    required this.price,
    required this.destination,
    required this.departure,
    required this.duration,
    required this.airline,
  });

  factory FlightRecommend.fromJson(Map<String, dynamic> json) {
    return FlightRecommend(
      id: json['id'] ?? 0,
      price: (json['price_flight'] is String) 
          ? double.tryParse(json['price_flight']) ?? 0.0 
          : (json['price_flight'] ?? 0.0).toDouble(),
      departure: json['departure_city'] ?? '',
      destination: json['destination_city'] ?? '',
      duration: _formatDate(json['departure_date'] ?? '1970-01-01'),
      airline: json['airline'] ?? '',
    );
  }

  static String _formatDate(String dateStr) {
    try {
      DateTime date = DateTime.parse(dateStr);
      return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    } catch (e) {
      return '1970-01-01';
    }
  }
}
