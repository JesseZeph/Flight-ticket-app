// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:ticketapp/utils/app_layout.dart';
import 'package:ticketapp/utils/app_styles.dart';
import 'package:ticketapp/widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  const TicketView({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(200),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          children: [
            /*
              SHOWING THE PURPLE PART OF THE CARD TICKET
              */
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF8E24AA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppLayout.getHeight(21)),
                  topRight: Radius.circular(AppLayout.getHeight(16)),
                ),
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      ThickContainer(),
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            height: AppLayout.getHeight(24),
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                print(
                                    'The width is ${constraints.constrainWidth()}');
                                return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      (constraints.constrainWidth() / 6)
                                          .floor(),
                                      ((index) => const SizedBox(
                                            width: 3,
                                            height: 1,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ))),
                                );
                              },
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: 1.5,
                              child: const Icon(
                                Icons.local_airport_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )),
                      ThickContainer(),
                      Expanded(child: Container()),
                      Text(
                        ticket['to']['code'],
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(ticket['from']['name'],
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white)),
                      ),
                      Text(ticket['flying_time'],
                          style: Styles.headLineStyle3
                              .copyWith(color: Colors.white)),
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(ticket['to']['name'],
                            textAlign: TextAlign.end,
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            /* 
              SHOWING THE ORANGE PART OF CART TICKET
              */
            Container(
              color: Styles.pinkColor,
              child: Row(
                children: [
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(AppLayout.getHeight(10)),
                          bottomRight: Radius.circular(AppLayout.getHeight(10)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(AppLayout.getHeight(12)),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              (constraints.constrainWidth() / 15).floor(),
                              (index) => const SizedBox(
                                    width: 5,
                                    height: 1,
                                    child: DecoratedBox(
                                        decoration:
                                            BoxDecoration(color: Colors.white)),
                                  )),
                        );
                      },
                    ),
                  )),
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppLayout.getHeight(10)),
                          bottomLeft: Radius.circular(AppLayout.getHeight(10)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            /*
            Bottom part of the card ticket
             */
            Container(
              decoration: BoxDecoration(
                  color: Styles.pinkColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                    bottomRight: Radius.circular(AppLayout.getWidth(21)),
                  )),
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticket['date'],
                            style: Styles.headLineStyle3
                                .copyWith(color: Colors.white),
                          ),
                          const Gap(5),
                          Text(
                            'Date',
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            ticket['departure_time'],
                            style: Styles.headLineStyle3
                                .copyWith(color: Colors.white),
                          ),
                          const Gap(5),
                          Text(
                            'Departure time',
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            ticket['number'].toString(),
                            style: Styles.headLineStyle3
                                .copyWith(color: Colors.white),
                          ),
                          const Gap(5),
                          Text(
                            'Number',
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
