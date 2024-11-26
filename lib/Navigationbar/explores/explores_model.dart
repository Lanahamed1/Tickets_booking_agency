class Trip {
  final String country;
  final int rating;
  final String description;

  Trip({
    required this.country,
    required this.rating,
    required this.description,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      country: json['departure_city'],
      rating: json['ratings'],
      description: json['notes'],
    );
  }
}
