import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Booking/Booking_controller.dart';
import 'package:flutter_tickets_booking_agency/Booking/Details/booking_details.dart';
import 'package:flutter_tickets_booking_agency/Booking/Details/details_controller.dart';
import 'package:flutter_tickets_booking_agency/app_layot.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';
import 'package:date_format_field/date_format_field.dart';

class Booking extends StatelessWidget {
  final int id;

  Booking({required this.id});
  final BookingController controller = Get.put(BookingController());
  final ReservationController reservationController =
      Get.put(ReservationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        elevation: 0.0,
        title: SizedBox(
          child: Container(
            margin: const EdgeInsets.only(top: 3),
            child: const Text(
              "Passenger",
              style: TextStyle(
                  color: Color.fromARGB(255, 2, 146, 219),
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: EdgeInsets.all(AppLayout.getHeight(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<int>(
                  padding: EdgeInsets.all(AppLayout.getHeight(5)),
                  value: controller.passengersCount.value,
                  items: List.generate(
                    controller.maxPassengers,
                    (index) => DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text('${index + 1}'),
                    ),
                  ),
                  onChanged: (value) {
                    controller.updatePassengersCount(value ?? 1);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1)),
                    fillColor: Colors.white,
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    label: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 9),
                      child: Text(
                        "Passenger Count",
                        style: Styles.headLineStyle33,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppLayout.getHeight(20),
                ),
                Obx(
                  () => Container(
                    padding: const EdgeInsets.all(15),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                      children: List.generate(
                        controller.passengersCount.value,
                        (index) => _buildPassengerForm(index),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: AppLayout.getHeight(25)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(255, 231, 226, 226),
                            width: 1,
                          ),
                        ),
                        child: Column(children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(15),
                            child: Text(" Baggage info",
                                style: Styles.headLineStyle33),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.all(15),
                            child: Text("Personal item",
                                style: Styles.headLineStyle13),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.all(15),
                            child: const Text(
                                "A small bag that must fit under the seat in front of you.",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13)),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            margin: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                Image.asset(
                                  'images/personalbag.png',
                                  height: 150,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 0, bottom: 1, left: 17, right: 30),
                                  child: Text('3 kg for all classes'),
                                )
                              ],
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 231, 226, 226),
                                    width: 1),
                              ),
                              child: Column(children: [
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: const EdgeInsets.all(15),
                                  child: Text("Hand item",
                                      style: Styles.headLineStyle13),
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: const EdgeInsets.all(15),
                                  child: const Text(
                                      "Backpack or handbag that goes in the overhead compartment.",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 13)),
                                ),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: const EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/handbag.png',
                                        height: 150,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 0,
                                            bottom: 1,
                                            left: 17,
                                            right: 30),
                                        child: Text(
                                            'Economy Class 7 kg \nBusiness Class 10 kg \nFirst Class 10 kg'),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 231, 226, 226),
                                        width: 1),
                                  ),
                                  child: Column(children: [
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      margin: const EdgeInsets.all(15),
                                      child: Text("Checked baggage",
                                          style: Styles.headLineStyle13),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      margin: const EdgeInsets.all(15),
                                      child: const Text(
                                          "Suitcase or other bag that you want to checked in.",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13)),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomLeft,
                                      margin: const EdgeInsets.all(15),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'images/checkedbag.png',
                                            height: 150,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 0,
                                                bottom: 1,
                                                left: 17,
                                                right: 30),
                                            child: Text(
                                                'Economy Class 30 kg\nBusiness Class 30 kg \nFirst Class 40 kg '),
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                                )
                              ]))
                        ])),
                  ],
                ),
                SizedBox(
                  height: AppLayout.getHeight(20),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 49),
                    width: AppLayout.getWidth(200),
                    height: AppLayout.getHeight(45),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade600,
                      borderRadius: BorderRadius.circular(250),
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        controller.validateFormAndNavigate();
                        await controller.submitBooking(id);
                        await Get.to(() => ReservationView(
                              newBookingIds: controller.bookingIds,
                            ));
                      },
                      child: const Text(
                        "Continue",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            letterSpacing: 0.2,
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPassengerForm(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: AppLayout.getHeight(150),
          color: Colors.white,
          child: Center(
            child: Container(
              alignment: Alignment.center,
              width: 400,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                border: Border.all(color: Colors.blue, width: 1),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 35, right: 3, left: 7),
                    child: Icon(
                      Icons.info_sharp,
                      size: 20,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Please enter your first name, last name \n exactly  as the appear on your passport\n to avoid  issues  at the airport.",
                      style: TextStyle(color: Color.fromARGB(255, 23, 22, 22)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Text(
          'Passenger ${index + 1}',
          style: Styles.headLineStyle33,
        ),
        SizedBox(
          height: AppLayout.getHeight(24),
        ),
        TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text("First name", style: Styles.headLineStyle34),
            ),
          ),
          onChanged: (value) {
            controller.updateFirstName(index, value);
          },
        ),
        SizedBox(
          height: AppLayout.getHeight(20),
        ),
        TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text("Last name", style: Styles.headLineStyle34),
            ),
          ),
          onChanged: (value) {
            controller.updateLastName(index, value);
          },
        ),
        SizedBox(
          height: AppLayout.getHeight(20),
        ),
        DateFormatField(
            type: DateFormatType.type1,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text("Date of birth", style: Styles.headLineStyle34),
              ),
            ),
            onComplete: (value) {
              controller.updateDateOfBirth(index, value!.toString());
            }),
        SizedBox(
          height: AppLayout.getHeight(20),
        ),
        TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text("National number", style: Styles.headLineStyle34),
            ),
          ),
          onChanged: (value) {
            controller.updateNationalNumber(index, value);
          },
        ),
        SizedBox(
          height: AppLayout.getHeight(20),
        ),
        DropdownButtonFormField<String>(
            style: Styles.headLineStyle13,
            value: controller.passengers[index].gender,
            items: ['Mr', 'Ms']
                .map(
                  (gender) => DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  ),
                )
                .toList(),
            onChanged: (value) {
              controller.updateGender(index, value ?? 'Mr');
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "Select Gender",
              labelStyle: Styles.headLineStyle3,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            )),
        SizedBox(
          height: AppLayout.getHeight(50),
        ),
      ],
    );
  }
}
