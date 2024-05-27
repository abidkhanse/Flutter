import 'package:first_flutter_project/utils/app_layout.dart';
import 'package:first_flutter_project/utils/app_styles.dart';
import 'package:first_flutter_project/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class TicketView extends StatelessWidget {

  final Map<String, dynamic> ticket;
  const TicketView({super.key, required this.ticket}) ;

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getScreenSize(context);
    return SizedBox(
      width: size.width * .85,
      height: AppLayout.getHeight(200, context),
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        child: Column(
          children: [

            Container (
              decoration: BoxDecoration(
                color: const Color(0xff526799),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppLayout.getHeight(21, context)),
                    topRight: Radius.circular(AppLayout.getHeight(21, context))),
              ),

              padding: EdgeInsets.all(AppLayout.getHeight(16, context)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(ticket['from']['code'],
                      style: Styles.headlineStyle3.copyWith(color: Colors.white),),
                      Expanded(
                        child: Container(),
                      ),
                      const ThickContainer(),
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            height: AppLayout.getHeight(24, context),
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Flex (
                                  direction: Axis.horizontal,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      (constraints.constrainWidth() / 8)
                                          .floor(),
                                      (index) => const SizedBox(
                                            width: 3,
                                            height: 1,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                            ),
                                          )),
                                );
                              },
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                            angle: 1.5,
                            child: const Icon (
                              Icons.local_airport_rounded,
                              color: Colors.white,
                            ),
                          )),
                        ],
                      )),
                      const ThickContainer(),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        ticket['to']['code'],
                        style:
                            Styles.headlineStyle3.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100, context),
                        child: Text(ticket['from']['name'],
                        style: Styles.headlineStyle4.copyWith(color: Colors.white)),
                      ),
                      Text(
                        ticket['flying_time'],
                        style:
                            Styles.headlineStyle4.copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        width: AppLayout.getWidth(100, context),
                        child: Text(ticket['to']['code'],
                            textAlign: TextAlign.right,
                            style: Styles.headlineStyle4
                                .copyWith(color: Colors.white)),
                      )
                    ],
                  )
                ],
              ),
            ),

            Container(
              color: Styles.orangeColor,
              child: Row(
                children: [
                   SizedBox(
                    height: AppLayout.getHeight(20, context),
                    width: AppLayout.getWidth(10, context),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(AppLayout.getWidth(10, context)),
                                bottomRight: Radius.circular(AppLayout.getWidth(10, context))))),
                  ),
                  Expanded(child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            (constraints.constrainWidth() / 15).floor(),
                            (index) =>  SizedBox(
                                  width: AppLayout.getWidth(5, context),
                                  height: AppLayout.getHeight(1, context),
                                  child: const DecoratedBox(
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                  ),
                                )),
                      );
                    },
                  )),
                  SizedBox(
                    height: AppLayout.getWidth(20, context),
                    width: AppLayout.getWidth(10, context),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppLayout.getWidth(10, context)),
                                bottomLeft: Radius.circular(AppLayout.getWidth(10, context))))),
                  )
                ],
              ),
            ),

            Container (
              decoration: BoxDecoration (
              color: Styles.orangeColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppLayout.getWidth(21, context)),
                  bottomRight: Radius.circular(AppLayout.getWidth(21, context))),
            ),

            padding: EdgeInsets.only(
                left: AppLayout.getWidth(16, context),
                top: AppLayout.getWidth(10, context),
                right: AppLayout.getWidth(16, context),
                bottom: AppLayout.getWidth(16, context)),
              child: Column(
                children: [
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ticket['date'],
                            style: Styles.headlineStyle3.copyWith(color: Colors.white),),
                          const Gap(5),
                          Text("Date",
                            style: Styles.headlineStyle4.copyWith(color: Colors.white),),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(ticket['departure_time'],
                            style: Styles.headlineStyle3.copyWith(color: Colors.white),),
                          const Gap(5),
                          Text("Departure Time",
                            style: Styles.headlineStyle4.copyWith(color: Colors.white),),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(ticket['number'].toString(),
                            style: Styles.headlineStyle3.copyWith(color: Colors.white),),
                          const Gap(5),
                          Text("Number",
                            style: Styles.headlineStyle4.copyWith(color: Colors.white),),
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

    return const Placeholder();
  }
}
