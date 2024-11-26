class ModifyModel {
  final int id;
  final double price;
  final String destination;
  final String departure;
  final String departureTime;
  final String airline;
  final String duration;
  final String arrivalTime;

  // final String notes;

  ModifyModel(
      {required this.id,
      required this.arrivalTime,
      required this.price,
      required this.departureTime,
      required this.destination,
      required this.departure,
      required this.duration,
      required this.airline
      // required this.notes,
      });
}
