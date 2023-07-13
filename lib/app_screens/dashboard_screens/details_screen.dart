import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tif_interview_assignment/app_models/event_model.dart';
import '../../app_models/app_enums.dart';
import '../../app_utils/colors.dart';
import '../cubit/dashboard_cubit.dart';

class EventDetailsScreen extends StatelessWidget {
  final num eventId;
  const EventDetailsScreen({
    Key? key,
    required this.eventId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: BlocConsumer<DashboardCubit, DashboardState>(
        listener: (context, state) {},
        builder: (context, state) {
          debugPrint(state.eventDetailsLoadingStatus.toString());
          if (state.eventDetailsLoadingStatus == LoadState.initial ||
              state.eventDetailsLoadingStatus == LoadState.loading) {
            return Scaffold(
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.28,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: CupertinoColors.systemGrey2),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 36,
                            width: (size.width - 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CupertinoColors.systemGrey2,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 42,
                              width: 42,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: CupertinoColors.systemGrey5,
                              ),
                            ),
                            title: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 24,
                              width: (size.width - 140),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CupertinoColors.systemGrey3,
                              ),
                            ),
                            subtitle: Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              height: 20,
                              width: (size.width - 140) * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CupertinoColors.systemGrey5,
                              ),
                            ),
                          ),
                          // Date time
                          const SizedBox(height: 15),
                          // Location
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 42,
                              width: 42,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: CupertinoColors.systemGrey5,
                              ),
                            ),
                            title: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 24,
                              width: (size.width - 140),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CupertinoColors.systemGrey3,
                              ),
                            ),
                            subtitle: Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              height: 20,
                              width: (size.width - 140) * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CupertinoColors.systemGrey5,
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 42,
                              width: 42,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: CupertinoColors.systemGrey5,
                              ),
                            ),
                            title: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 24,
                              width: (size.width - 140),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CupertinoColors.systemGrey3,
                              ),
                            ),
                            subtitle: Container(
                              margin: const EdgeInsets.only(right: 10, top: 10),
                              height: 20,
                              width: (size.width - 140) * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CupertinoColors.systemGrey5,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 38,
                            width: (size.width - 140),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CupertinoColors.systemGrey3,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 28,
                            width: (size.width),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CupertinoColors.systemGrey3,
                            ),
                          ),
                          const SizedBox(height: 5),

                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 28,
                            width: (size.width),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CupertinoColors.systemGrey3,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 28,
                            width: (size.width),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CupertinoColors.systemGrey3,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 28,
                            width: (size.width) * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CupertinoColors.systemGrey3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state.eventDetailsLoadingStatus ==
              LoadState.errorLoading) {
            return Scaffold(
              body: RefreshIndicator(
                onRefresh: () {
                  return context
                      .read<DashboardCubit>()
                      .refreshEventDetails(eventId);
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

          num index = context.read<DashboardCubit>().getEventDetails(eventId);
          EventModel eventModel = state.listOfCachedEvents![index.toInt()];
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () {
                return context
                    .read<DashboardCubit>()
                    .refreshEventDetails(eventId);
              },
              color: defaultPurpleBlueshColor,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.28,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(eventModel.bannerImage!,
                                scale: 1.5)),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          ListTile(
                            leading: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: CupertinoColors.white,
                                size: 32,
                              ),
                            ),
                            title: const Text(
                              'Event Details ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                                color: CupertinoColors.white,
                              ),
                            ),
                            trailing: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: CupertinoColors.white.withOpacity(0.25),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark,
                                  color: CupertinoColors.white,
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${eventModel.title}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                              // color: CupertinoColors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: CupertinoColors.white.withOpacity(0.25),
                              ),
                              child: Image.network(
                                eventModel.organiserIcon!,
                                height: 40,
                                width: 40,
                                errorBuilder: (ctx, _, __) {
                                  return Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: defaultPurpleBlueshColor
                                          .withOpacity(0.15),
                                    ),
                                    child: Icon(
                                      Icons.logo_dev,
                                      size: 32,
                                      color: defaultPurpleBlueshColor,
                                    ),
                                  );
                                },
                              ),
                            ),
                            title: Text(
                              '${eventModel.organiserName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                // color: CupertinoColors.white,
                              ),
                            ),
                            subtitle: const Text(
                              'Organiser',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                // color: CupertinoColors.white,
                              ),
                            ),
                          ),
                          // Date time
                          const SizedBox(height: 15),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:
                                    defaultPurpleBlueshColor.withOpacity(0.15),
                              ),
                              child: Icon(
                                Icons.calendar_month_rounded,
                                size: 32,
                                color: defaultPurpleBlueshColor,
                              ),
                            ),
                            title: Text(
                              '${eventModel.dateTime}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                // color: CupertinoColors.white,
                              ),
                            ),
                            subtitle: Text(
                              '${DateFormat('EEEE').format(eventModel.dateTime!)}, ${DateFormat('j').format(eventModel.dateTime!)} ',
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                // color: CupertinoColors.white,
                              ),
                            ),
                          ),
                          // Location
                          const SizedBox(height: 15),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:
                                    defaultPurpleBlueshColor.withOpacity(0.15),
                              ),
                              child: Icon(
                                Icons.location_on,
                                size: 32,
                                color: defaultPurpleBlueshColor,
                              ),
                            ),
                            title: Text(
                              '${eventModel.venueName}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                // color: CupertinoColors.white,
                              ),
                            ),
                            subtitle: Text(
                              '${eventModel.venueCity}, ${eventModel.venueCountry}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                // color: CupertinoColors.white,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                          const Text(
                            'About Event',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              // color: CupertinoColors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            '${eventModel.description}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              // color: CupertinoColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              margin: const EdgeInsets.only(
                  left: 30, right: 30, bottom: 20, top: 10),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: defaultPurpleBlueshColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(backgroundColor: defaultPurpleBlueshColor),
                    const Text(
                      'BOOK NOW',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: CupertinoColors.white,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: defaultPurpleBlueshColor,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
