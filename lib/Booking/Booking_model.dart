class Passenger {
  String firstName;
  String lastName;
  DateTime? dateOfBirth;
  String nationalNumber;
  String gender;

  Passenger({
    required this.firstName,
    required this.lastName,
    this.dateOfBirth,
    required this.nationalNumber,
    required this.gender,
  });
}
