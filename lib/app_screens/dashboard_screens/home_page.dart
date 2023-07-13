//https://bit.ly/tif-flutter-intern-assignment

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tif_interview_assignment/app_screens/dashboard_screens/details_screen.dart';
import 'package:tif_interview_assignment/app_screens/dashboard_screens/search_screen.dart';
import 'package:tif_interview_assignment/app_utils/colors.dart';
import '../../app_models/app_enums.dart';
import '../../app_models/event_model.dart';
import '../cubit/dashboard_cubit.dart';

class EventsListHomePage extends StatefulWidget {
  const EventsListHomePage({Key? key}) : super(key: key);

  @override
  State<EventsListHomePage> createState() => _EventsListHomePageState();
}

class _EventsListHomePageState extends State<EventsListHomePage> {
  @override
  void initState() {
    context.read<DashboardCubit>().initializeEventsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.listLoadingStatus == LoadState.initial ||
            state.listLoadingStatus == LoadState.loading) {
          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent),
              title: const Text(
                'Events',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const EventsListSearchPage()),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 28,
                    color: CupertinoColors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 28,
                    color: CupertinoColors.black,
                  ),
                ),
              ],
            ),
            body: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (ctx, index) {
                double blurRadius = 2.5;
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CupertinoColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.white,
                        blurRadius: blurRadius,
                        spreadRadius: 0.5,
                        offset: Offset(blurRadius, blurRadius),
                      ),
                      BoxShadow(
                        color: CupertinoColors.systemGrey6,
                        blurRadius: blurRadius,
                        spreadRadius: 2.5,
                        offset: Offset(blurRadius, blurRadius),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 100,
                        width: 88,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CupertinoColors.systemGrey4,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 16,
                                width: (size.width - 140),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: CupertinoColors.systemGrey3,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                height: 18,
                                width: (size.width - 140) * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: CupertinoColors.systemGrey2,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: CupertinoColors.systemGrey4,
                                ),
                                height: 18,
                                width: (size.width - 140),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: CupertinoColors.systemGrey4,
                                ),
                                height: 18,
                                width: (size.width - 140) * 0.4,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state.listLoadingStatus == LoadState.errorLoading) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () {
                return context.read<DashboardCubit>().initializeEventsData();
              },
              color: defaultPurpleBlueshColor,
              child: Center(
                child: ListView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  shrinkWrap: false,
                  children: [
                    SizedBox(height: size.height * 0.3),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          color: CupertinoColors.systemRed,
                          size: 48,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Error Loading Events, ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: CupertinoColors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Check Your Internet Connection and Try Again.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        double blurRadius = 2.5;
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            title: const Text(
              'Events',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const EventsListSearchPage()),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  size: 28,
                  color: CupertinoColors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  size: 28,
                  color: CupertinoColors.black,
                ),
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () {
              return context.read<DashboardCubit>().initializeEventsData();
            },
            color: defaultPurpleBlueshColor,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.listOfEvents!.length,
              itemBuilder: (ctx, index) {
                EventModel event = state.listOfEvents![index];

                return GestureDetector(
                  onTap: () {
                    context.read<DashboardCubit>().loadEventDetails(event.id!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) =>
                              EventDetailsScreen(eventId: event.id!)),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CupertinoColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: CupertinoColors.white,
                          blurRadius: blurRadius,
                          spreadRadius: 0.5,
                          offset: Offset(blurRadius, blurRadius),
                        ),
                        BoxShadow(
                          color: CupertinoColors.systemGrey6,
                          blurRadius: blurRadius,
                          spreadRadius: 2.5,
                          offset: Offset(blurRadius, blurRadius),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 100,
                          width: 88,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              event.bannerImage!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text:
                                        '${DateFormat('EEEE').format(event.dateTime!)}, ${DateFormat('MMMM').format(event.dateTime!)} ${event.dateTime!.day}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: defaultPurpleBlueshColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' • ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: defaultPurpleBlueshColor,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      TextSpan(
                                        text: DateFormat('j')
                                            .format(event.dateTime!),
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: defaultPurpleBlueshColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 2.5),
                                Text(
                                  '${event.title}',
                                  softWrap: true,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 140,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Icon(
                                    Icons.location_on,
                                    color: CupertinoColors.systemGrey,
                                    size: 18,
                                  ),
                                  Flexible(
                                    child: Text(
                                      '${event.venueName} • ${event.venueCity}, ${event.venueCountry} ',
                                      softWrap: true,
                                      // overflow: TextOverflow.visible,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: CupertinoColors.systemGrey,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     Flexible(
                            //       child: Text(
                            //         '\uE0C8 ${event.venueName} • ${event.venueCity}, ${event.venueCountry} ',
                            //         softWrap: true,
                            //         // overflow: TextOverflow.visible,
                            //         maxLines: 2,
                            //         style: const TextStyle(
                            //           fontSize: 14,
                            //           color: CupertinoColors.systemGrey,
                            //           fontWeight: FontWeight.w400,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                        // Flexible(
                        //   child: ListTile(
                        //     onTap: () {
                        //       context
                        //           .read<DashboardCubit>()
                        //           .loadEventDetails(event.id!);
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (ctx) =>
                        //                 EventDetailsScreen(eventId: event.id!)),
                        //       );
                        //     },
                        //     dense: false,
                        //     // leading: Container(
                        //     //   height: 240,
                        //     //   width: 120,
                        //     //   child: ClipRRect(
                        //     //     borderRadius: BorderRadius.circular(10),
                        //     //     child: AspectRatio(
                        //     //       aspectRatio: 1200 / 240,
                        //     //       child: Image.network(
                        //     //         event.bannerImage!,
                        //     //         width: 120,
                        //     //         height: 240,
                        //     //         fit: BoxFit.fill,
                        //     //       ),
                        //     //     ),
                        //     //   ),
                        //     // ),
                        //     title: RichText(
                        //       text: TextSpan(
                        //         text:
                        //             '${DateFormat('EEEE').format(event.dateTime!)}, ${DateFormat('MMMM').format(event.dateTime!)} ${event.dateTime!.day}',
                        //         style: const TextStyle(
                        //           fontSize: 16,
                        //           color: CupertinoColors.systemBlue,
                        //           fontWeight: FontWeight.w400,
                        //         ),
                        //         children: [
                        //           const TextSpan(
                        //             text: ' • ',
                        //             style: TextStyle(
                        //               fontSize: 18,
                        //               color: CupertinoColors.systemBlue,
                        //               fontWeight: FontWeight.w800,
                        //             ),
                        //           ),
                        //           TextSpan(
                        //             text: DateFormat('j').format(event.dateTime!),
                        //             style: const TextStyle(
                        //               fontSize: 16,
                        //               color: CupertinoColors.systemBlue,
                        //               fontWeight: FontWeight.w400,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     subtitle: Column(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           '${event.title}',
                        //           softWrap: true,
                        //           style: const TextStyle(
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.w500,
                        //           ),
                        //         ),
                        //         const SizedBox(height: 3),
                        //         Wrap(
                        //           // mainAxisAlignment: MainAxisAlignment.start,
                        //           alignment: WrapAlignment.start,
                        //           crossAxisAlignment: WrapCrossAlignment.center,
                        //           children: [
                        //             const Icon(
                        //               Icons.location_on,
                        //               size: 14,
                        //               color: CupertinoColors.systemGrey,
                        //             ),
                        //             const SizedBox(width: 5),
                        //             Text(
                        //               '${event.venueName}',
                        //               softWrap: true,
                        //               style: const TextStyle(
                        //                 fontSize: 14,
                        //                 fontWeight: FontWeight.w500,
                        //                 color: CupertinoColors.systemGrey,
                        //               ),
                        //             ),
                        //             const SizedBox(width: 2.5),
                        //             const Icon(
                        //               Icons.circle,
                        //               size: 10,
                        //               color: CupertinoColors.systemGrey,
                        //             ),
                        //             const SizedBox(width: 2.5),
                        //             Text(
                        //               '${event.venueCity}, ${event.venueCountry} ',
                        //               softWrap: true,
                        //               style: const TextStyle(
                        //                 fontSize: 14,
                        //                 fontWeight: FontWeight.w500,
                        //                 color: CupertinoColors.systemGrey,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
