import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/policy/modify_model.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/policy/modify_controller.dart';
import 'package:flutter_tickets_booking_agency/Navigationbar/my_Booking/policy/modifycard.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ModifyFlights extends StatelessWidget {
  final int id;

  const ModifyFlights({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(controllermodify());

    // Fetch data when the widget is built
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controller.fetchData(id);
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: SizedBox(
          child: Container(
            margin: const EdgeInsets.only(top: 3),
            child: Text("Select flight", style: Styles.headLineStyle23),
          ),
        ),
      ),
      body: Container(
        color: const Color(0XFFE1EDFF),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.isError.value) {
            return Center(child: Text('Failed to fetch data'));
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                ModifyModel flightmodel = controller.modify[index];
                return ModifyCard(flights: flightmodel);
              },
              itemCount: controller.modify.length,
            );
          }
        }),
      ),
    );
  }
}