import 'package:flutter/material.dart';
import 'package:flutter_tickets_booking_agency/Tickets/tickets_controller.dart';
import 'package:flutter_tickets_booking_agency/Tickets/widget.dart';
import 'package:flutter_tickets_booking_agency/app_layot.dart';
import 'package:flutter_tickets_booking_agency/appstyle.dart';
import 'package:get/get.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:gap/gap.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLayout.getSize(context);
    final TicketController controller = Get.put(TicketController());

    return Scaffold(
      backgroundColor: const Color(0XFFE1EDFF),
      body: SafeArea(
        child: Obx(() {
          final ticket = controller.ticket.value;
          return ListView(
            padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getWidth(20),
                vertical: AppLayout.getHeight(1)),
            children: [
              Gap(AppLayout.getHeight(15)),
              Text("Tickets",
                  style: Styles.headLineStyle1
                      .copyWith(fontSize: AppLayout.getHeight(35))),
              Gap(AppLayout.getHeight(20)),
              Container(
                margin: EdgeInsets.all(AppLayout.getHeight(10)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(AppLayout.getHeight(20)))),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(AppLayout.getHeight(15)),
                      child: Row(
                        children: [
                          Text(ticket.from,
                              style: Styles.headLineStyle37
                                  .copyWith(color: Colors.black)),
                          const Spacer(flex: 1),
                          RoundShape(shapeColor: Colors.blue),
                          Expanded(
                              child: Stack(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: AppLayout.getHeight(24),
                                  child: LayoutBuilder(
                                    builder: (BuildContext buildContext,
                                        BoxConstraints boxConstrains) {
                                      return Flex(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        direction: Axis.horizontal,
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                          (boxConstrains.constrainWidth() / 6)
                                              .floor(),
                                          (index) => SizedBox(
                                            height: AppLayout.getHeight(1),
                                            width: AppLayout.getWidth(3),
                                            child: const DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: Colors.blue),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                  angle: 1.5,
                                  child: const Center(
                                      child: Icon(
                                    Icons.local_airport_rounded,
                                    color: Colors.blue,
                                  ))),
                            ],
                          )),
                          RoundShape(shapeColor: Colors.blue),
                          const Spacer(flex: 1),
                          Text(ticket.to, style: Styles.textStyle2),
                        ],
                      ),
                    ),
                    const Gap(3),
                    Container(
                      padding: EdgeInsets.only(
                          left: AppLayout.getHeight(16),
                          right: AppLayout.getHeight(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(ticket.from, style: Styles.headLineStyle38),
                          Text(ticket.duration, style: Styles.headLineStyle38),
                          Text(ticket.to, style: Styles.headLineStyle38),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(21),
                              bottomRight: Radius.circular(21))),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: AppLayout.getHeight(20),
                                width: AppLayout.getWidth(10),
                                child: const DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                ),
                              ),
                              Expanded(
                                child: LayoutBuilder(
                                  builder: (BuildContext buildContext,
                                      BoxConstraints boxConstraints) {
                                    return Flex(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        direction: Axis.horizontal,
                                        children: List.generate(
                                            (boxConstraints.constrainWidth() /
                                                    15)
                                                .floor(),
                                            (index) => const SizedBox(
                                                width: 5,
                                                height: 1,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      color: Colors.black),
                                                ))));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: AppLayout.getHeight(20),
                                width: AppLayout.getWidth(10),
                                child: const DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10))),
                                ),
                              )
                            ],
                          ),
                          const Gap(10),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(ticket.date,
                                        style: Styles.headLineStyle3
                                            .copyWith(color: Colors.black)),
                                    Text("Date", style: Styles.headLineStyle4)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(ticket.departureTime,
                                        style: Styles.headLineStyle37
                                            .copyWith(color: Colors.black)),
                                    Text("Departure Time",
                                        style: Styles.headLineStyle4)
                                  ],
                                ),
                                if (ticket.isRoundTrip)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                              ticket.returnDepartureDate
                                                  .toString(),
                                              style: Styles.headLineStyle3
                                                  .copyWith(
                                                      color: Colors.black)),
                                          Text("Return Date",
                                              style: Styles.headLineStyle4),
                                        ],
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(thickness: AppLayout.getHeight(1.5)),
                    Container(
                      padding: EdgeInsets.only(
                          left: AppLayout.getHeight(16),
                          right: AppLayout.getHeight(16),
                          top: AppLayout.getHeight(8)),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(ticket.passengerName,
                                  style: Styles.headLineStyle37
                                      .copyWith(color: Colors.black)),
                              Gap(AppLayout.getHeight(5)),
                              Text("Passenger", style: Styles.headLineStyle3)
                            ],
                          ),
                          Column(
                            children: [
                              Text(ticket.passportNumber,
                                  style: Styles.headLineStyle37
                                      .copyWith(color: Colors.black)),
                              Gap(AppLayout.getHeight(5)),
                              Text("Passport", style: Styles.headLineStyle3)
                            ],
                          )
                        ],
                      ),
                    ),
                    Gap(AppLayout.getHeight(5)),
                    SizedBox(
                      child: SizedBox(
                        height: AppLayout.getHeight(24),
                        child: LayoutBuilder(
                          builder: (BuildContext buildContext,
                              BoxConstraints boxConstrains) {
                            return Flex(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              direction: Axis.horizontal,
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  (boxConstrains.constrainWidth() / 6).floor(),
                                  (index) => SizedBox(
                                        height: AppLayout.getHeight(1),
                                        width: AppLayout.getWidth(3),
                                        child: const DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: Colors.blue),
                                        ),
                                      )),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: AppLayout.getHeight(16),
                          right: AppLayout.getHeight(16),
                          top: AppLayout.getHeight(8)),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(ticket.airline,
                                  style: Styles.headLineStyle37
                                      .copyWith(color: Colors.black)),
                              Gap(AppLayout.getHeight(5)),
                              Text("Airline", style: Styles.headLineStyle37)
                            ],
                          ),
                          Column(
                            children: [
                              Text(ticket.trip_type,
                                  style: Styles.headLineStyle37
                                      .copyWith(color: Colors.black)),
                              Gap(AppLayout.getHeight(5)),
                              Text("Trip-Type", style: Styles.headLineStyle37)
                            ],
                          )
                        ],
                      ),
                    ),
                    Gap(AppLayout.getHeight(5)),
                    SizedBox(
                      child: SizedBox(
                        height: AppLayout.getHeight(24),
                        child: LayoutBuilder(
                          builder: (BuildContext buildContext,
                              BoxConstraints boxConstrains) {
                            return Flex(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              direction: Axis.horizontal,
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  (boxConstrains.constrainWidth() / 6).floor(),
                                  (index) => SizedBox(
                                        height: AppLayout.getHeight(1),
                                        width: AppLayout.getWidth(3),
                                        child: const DecoratedBox(
                                          decoration:
                                              BoxDecoration(color: Colors.blue),
                                        ),
                                      )),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: AppLayout.getHeight(16),
                          right: AppLayout.getHeight(16),
                          top: AppLayout.getHeight(8),
                          bottom: AppLayout.getHeight(16)),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(ticket.seattype,
                                  style: Styles.headLineStyle37
                                      .copyWith(color: Colors.black)),
                              Gap(AppLayout.getHeight(5)),
                              Text("Class of Service",
                                  style: Styles.headLineStyle37)
                            ],
                          ),
                          Column(
                            children: [
                              Text(ticket.price,
                                  style: Styles.headLineStyle37
                                      .copyWith(color: Colors.black)),
                              Gap(AppLayout.getHeight(5)),
                              Text("Price", style: Styles.headLineStyle37)
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(thickness: AppLayout.getHeight(1.5)),
                    Container(
                      padding: EdgeInsets.only(
                          left: AppLayout.getHeight(16),
                          right: AppLayout.getHeight(16),
                          top: AppLayout.getHeight(8),
                          bottom: AppLayout.getHeight(16)),
                      child: Column(
                        children: [
                          BarcodeWidget(
                            barcode: Barcode.code128(),
                            data:
                                "https://github.com/Lanahamed1/Tickets-Booking-Agency",
                            drawText: false,
                            color: Colors.black,
                            width: double.infinity,
                            height: AppLayout.getHeight(70),
                          ),
                          Gap(AppLayout.getHeight(10)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
