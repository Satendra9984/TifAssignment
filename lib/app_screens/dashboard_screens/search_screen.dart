//https://bit.ly/tif-flutter-intern-assignment

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tif_interview_assignment/app_screens/dashboard_screens/details_screen.dart';
import 'package:tif_interview_assignment/app_utils/colors.dart';
import '../../app_models/event_model.dart';
import '../cubit/dashboard_cubit.dart';

class EventsListSearchPage extends StatefulWidget {
  const EventsListSearchPage({Key? key}) : super(key: key);

  @override
  State<EventsListSearchPage> createState() => _EventsListSearchPageState();
}

class _EventsListSearchPageState extends State<EventsListSearchPage> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    context.read<DashboardCubit>().initializeEventsData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        double blurRadius = 2.5;

        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            title: const Text(
              'Search',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: Column(
            children: [
              FormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                initialValue: _textEditingController,
                validator: (controller) {
                  if (_textEditingController.text.isEmpty) {
                    return 'Enter Your Query';
                  }
                  return null;
                },
                builder: (formState) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Icon(
                            Icons.search,
                            size: 28,
                            color: defaultPurpleBlueshColor,
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: TextField(
                            onChanged: (value) {
                              _textEditingController.text = value;
                              _textEditingController.selection =
                                  TextSelection.collapsed(
                                      offset:
                                          _textEditingController.text.length);
                              formState.didChange(_textEditingController);

                              if (formState.hasError == false) {
                                context.read<DashboardCubit>().loadSearchEvents(
                                    _textEditingController.text);
                              }
                            },
                            controller: _textEditingController,
                            keyboardType: TextInputType.text,
                            cursorColor: CupertinoColors.black,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                              color: CupertinoColors.black,
                            ),
                            decoration: const InputDecoration(
                              isDense: false,
                              hintText: 'Type Event Name',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: CupertinoColors.systemGrey,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.listOfSearchedEvents!.length,
                  itemBuilder: (ctx, index) {
                    EventModel event = state.listOfSearchedEvents![index];

                    return GestureDetector(
                      onTap: () {
                        context
                            .read<DashboardCubit>()
                            .loadEventDetails(event.id!);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) =>
                                  EventDetailsScreen(eventId: event.id!)),
                        );
                      },
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.6,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 20),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text:
                                        '${DateFormat('EEEE').format(event.dateTime!)}, ${DateFormat('MMMM').format(event.dateTime!)} ${event.dateTime!.day}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: defaultPurpleBlueshColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' • ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: defaultPurpleBlueshColor,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      TextSpan(
                                        text: DateFormat('j')
                                            .format(event.dateTime!),
                                        style: TextStyle(
                                          fontSize: 16,
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
