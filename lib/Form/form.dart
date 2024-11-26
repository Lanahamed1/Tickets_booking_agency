import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Form/travel%20form_controller.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/Main_page.dart';
import 'package:flutter_tickets_booking_agency/app_layot.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';

class TravelView extends StatelessWidget {
  final TravelController controller = Get.put(TravelController());

  TravelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 172, 164, 164), width: 3)),
        child: Column(
          children: [
            const SizedBox(
              height: 2,
            ),
            Text(
              "If you wish, fill out this form with the required information",
              style: Styles.headLineStyle20,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 34,
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Enter your current city",
                hintStyle: Styles.headLineStyle7,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                label: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 9),
                  child: Text("Current City", style: Styles.headLineStyle31),
                ),
              ),
              onChanged: (value) => controller.setCurrentCountry(value),
            ),
            const SizedBox(
              height: 28,
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Enter your budget for the flight",
                hintStyle: Styles.headLineStyle7,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                label: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 9),
                  child: Text("Budget", style: Styles.headLineStyle31),
                ),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) => controller.setBudget(double.parse(value)),
            ),
            const SizedBox(
              height: 25,
            ),
            DropdownButtonFormField<String>(
                style: Styles.headLineStyle13,
                value: controller.preferredActivity.value.isEmpty
                    ? null
                    : controller.preferredActivity.value,
                items: ['Skiing', 'Beach Relaxation', 'Sightseeing']
                    .map(
                      (activity) => DropdownMenuItem<String>(
                        value: activity,
                        child: Text(activity),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  controller.setPreferredActivity(value!);
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  label: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: const Text("Preferred Activity")),
                  labelStyle: Styles.headLineStyle31,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                )),
            const SizedBox(
              height: 25,
            ),
            DropdownButtonFormField<String>(
                style: Styles.headLineStyle13,
                value: controller.travelPurpose.value.isEmpty
                    ? null
                    : controller.travelPurpose.value,
                items: ['Business', 'Tourism', 'Recreation', 'Education']
                    .map(
                      (purpose) => DropdownMenuItem<String>(
                        value: purpose,
                        child: Text(purpose),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  controller.setTravelPurpose(value!);
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  filled: true,
                  label: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: const Text("Travel Purpose")),
                  labelStyle: Styles.headLineStyle31,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                )),
            const SizedBox(
              height: 25,
            ),
            DropdownButtonFormField<String>(
                style: Styles.headLineStyle13,
                value: controller.preferredWeather.value.isEmpty
                    ? null
                    : controller.preferredWeather.value,
                items: ['Warm', 'Cold', 'Mild']
                    .map(
                      (weather) => DropdownMenuItem<String>(
                        value: weather,
                        child: Text(weather),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  controller.setPreferredWeather(value!);
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                  label: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: const Text("Favorite Weather")),
                  labelStyle: Styles.headLineStyle31,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                )),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: AppLayout.getWidth(90),
                  height: AppLayout.getHeight(37),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 205, 50, 50),
                    ),
                    color: const Color.fromARGB(255, 236, 74, 74),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Get.offAll(() => Mainpage());
                    },
                    child: const Text(
                      'Later',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  width: AppLayout.getWidth(100),
                  height: AppLayout.getHeight(37),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 2, 146, 219),
                    ),
                    color: const Color.fromARGB(255, 52, 186, 253),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      final flightRecommendations =
                          await controller.sendTravelPreferences();
                      if (flightRecommendations != null) {
                        Get.to(() => Mainpage(
                            flightRecommendations: flightRecommendations));
                      }
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
