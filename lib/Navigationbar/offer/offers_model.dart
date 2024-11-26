// offer_model.dart
class OfferModel {
  final int id;
  final String departure;
  final String destination;
  final String departureDate;
  final String returnDate;
  final String durationoffer;
  final Rating rate;
  final int price;
  final String image;
  final int amount;
  final String airline;

  OfferModel(
      {required this.id,
      required this.image,
      required this.rate,
      required this.price,
      required this.amount,
      required this.departure,
      required this.destination,
      required this.departureDate,
      required this.durationoffer,
      required this.airline,
      required this.returnDate});
}

class Rating {
  final double stars;

  Rating({required this.stars});
}
