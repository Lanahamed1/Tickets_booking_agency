//import 'package:app/view/navigationbar/Mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tickets_booking_agency/Screen/LogIn.dart';
import 'package:get/get.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/photo_2024.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'Let’s Enjoy The Beautiful World With Viawise',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Search the safest destination',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: MaterialButton(
                    height: 40,
                    minWidth: 85,
                    onPressed: () {
                      Get.to(() => LogIn());
                    },
                    color: const Color.fromARGB(255, 195, 202, 207),
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.blueGrey.shade600),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
