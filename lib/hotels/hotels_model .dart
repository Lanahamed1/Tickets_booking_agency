class Hotel {
  final String name;
  List<String> images;
  final String image;
  final String location;
  final String rate;
  final int price;
  final Rating rating;
  final String description;
  final String details;

  Hotel(
      {required this.name,
      required this.images,
      required this.description,
      required this.image,
      required this.location,
      required this.rate,
      required this.price,
      required this.rating,
      required this.details});
}

class Rating {
  final double stars;

  Rating({required this.stars});
}

class Describe {}
