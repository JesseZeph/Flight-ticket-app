import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketapp/screens/ticket_view.dart';
import 'package:ticketapp/utils/app_info_list.dart';
import 'package:ticketapp/utils/app_layout.dart';
import 'package:ticketapp/widgets/column_layout.dart';
import 'package:ticketapp/widgets/layout_builder_widget.dart';
import 'package:ticketapp/widgets/ticket_tabs.dart';
import 'package:barcode_widget/barcode_widget.dart';

import '../utils/app_styles.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      body: Stack(children: [
        ListView(
          padding: EdgeInsets.symmetric(
              horizontal: AppLayout.getHeight(20),
              vertical: AppLayout.getHeight(20)),
          children: [
            Gap(AppLayout.getHeight(40)),
            Text(
              'Tickets',
              style: Styles.headLineStyle,
            ),
            Gap(AppLayout.getHeight(20)),
            const AppTicketsTab(firstTab: 'Upcoming', secondTab: 'Previous'),
            Gap(AppLayout.getHeight(20)),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
              child: TicketView(
                ticket: ticketList[0],
                isColor: true,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AppColumnLayout(
                        firstText: 'Flutter DB',
                        secondText: 'Passenger',
                        alignment: CrossAxisAlignment.start,
                      ),
                      AppColumnLayout(
                        firstText: '5221 6784900',
                        secondText: 'passport',
                        alignment: CrossAxisAlignment.end,
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                  const AppLayoutBuilderWidget(
                    sections: 15,
                    isColor: false,
                    width: 5,
                  ),
                  Gap(AppLayout.getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AppColumnLayout(
                        firstText: '321573 543678300',
                        secondText: 'Number of E-ticket',
                        alignment: CrossAxisAlignment.start,
                      ),
                      AppColumnLayout(
                        firstText: '75CB54',
                        secondText: 'Booking code',
                        alignment: CrossAxisAlignment.end,
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                  const AppLayoutBuilderWidget(
                    sections: 15,
                    isColor: false,
                    width: 5,
                  ),
                  Gap(AppLayout.getHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/visa.png',
                                scale: 11,
                              ),
                              Text(
                                ' *** 24628',
                                style: Styles.headLineStyle3,
                              )
                            ],
                          ),
                          const Gap(5),
                          Text(
                            'Payment method',
                            style: Styles.headLineStyle4,
                          )
                        ],
                      ),
                      const AppColumnLayout(
                        firstText: '\$250.87',
                        secondText: 'Price',
                        alignment: CrossAxisAlignment.end,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Gap(AppLayout.getHeight(20)),
                ],
              ),
            ),
            /*
            Barcode
             */
            const SizedBox(
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(AppLayout.getHeight(21)),
                  bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                ),
              ),
              margin: EdgeInsets.only(
                  left: AppLayout.getHeight(15),
                  right: AppLayout.getHeight(15)),
              padding: EdgeInsets.only(
                  top: AppLayout.getHeight(20),
                  bottom: AppLayout.getHeight(20)),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppLayout.getHeight(20),
                    vertical: AppLayout.getHeight(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                  child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: 'https://github.com/JesseZeph',
                    drawText: false,
                    color: Styles.textColor,
                    width: double.infinity,
                    height: 70,
                  ),
                ),
              ),
            ),
            Gap(AppLayout.getHeight(20)),
            Container(
              padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
              child: TicketView(
                ticket: ticketList[0],
              ),
            ),
          ],
        ),
        Positioned(
          left: AppLayout.getHeight(22),
          top: AppLayout.getHeight(295),
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2)),
            child: CircleAvatar(
              maxRadius: 4,
              backgroundColor: Styles.textColor,
            ),
          ),
        ),
        Positioned(
          right: AppLayout.getHeight(22),
          top: AppLayout.getHeight(295),
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2)),
            child: CircleAvatar(
              maxRadius: 4,
              backgroundColor: Styles.textColor,
            ),
          ),
        )
      ]),
    );
  }
}
