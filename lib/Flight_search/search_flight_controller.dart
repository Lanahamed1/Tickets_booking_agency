import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightSearchController extends GetxController {
  DateTime? startDate;
  DateTime? endDate;
  String? selectDeparture = "Damascus(DAM)";
  String? selectDestination = "Damascus(DAM)";
  String? selectItem = '1';
  String? selectSeatClass = 'Economy';

  final List<String> depCity = [
    "Damascus(DAM)",
    'Beirut (BEY)',
    'Benina (BEN)',
    'Basra (BSR)',
    'Baghdad (BGW)',
    'Erbil (EBL)',
    'Najaf (NJF)',
    'Khartoum (KRT)',
    'Kuwait (KWI)',
    'Muscat (MCT)',
    'Abu Dhabi (AUH)',
    'Sharjah (SHJ)',
    'Tahran (IKA)',
    'Moscow (SVO)',
    'Yerevan (EVN)',
    'Karachi (KHI)',
    "Damascus International Airport",
    'King Abdulaziz International Airport',
    ' Damascus International Airport',
    ' Sheremetyevo International Airport'
  ];

  final List<String> descCity = [
    "Damascus(DAM)",
    'Beirut (BEY)',
    'Benina (BEN)',
    'Basra (BSR)',
    'Baghdad (BGW)',
    'Erbil (EBL)',
    'Najaf (NJF)',
    'Khartoum (KRT)',
    'Kuwait (KWI)',
    'Muscat (MCT)',
    'Abu Dhabi (AUH)',
    'Sharjah (SHJ)',
    'Tahran (IKA)',
    'Moscow (SVO)',
    'Yerevan (EVN)',
    'Karachi (KHI)',
    "Damascus International Airport",
    'King Abdulaziz International Airport',
    'Sheremetyevo International Airport',
    'Jinnah International Airport'
  ];

  final List<String> passengerNumbers = ['1', '2', '3'];
  final List<String> seatclass = ['Economy', 'Business Class', 'First Class'];

  void selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      startDate = picked;
    }
    update();
  }

  void selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      endDate = picked;
    }
    update();
  }

  void setDeparture(String? departure) {
    selectDeparture = departure;
    update();
  }

  void setDestination(String? destination) {
    selectDestination = destination;
    update();
  }

  void setPassengerNumber(String? number) {
    selectItem = number;
    update();
  }

  void setSeatClass(String? seatClasstype) {
    selectSeatClass = seatClasstype;
    update();
  }
}
