part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final LoadState listLoadingStatus;
  final List<EventModel>? listOfEvents;
  final LoadState eventDetailsLoadingStatus;
  final List<EventModel>? listOfCachedEvents;
  final List<EventModel>? listOfSearchedEvents;

  const DashboardState({
    this.listLoadingStatus = LoadState.initial,
    this.listOfEvents,
    this.listOfCachedEvents,
    this.eventDetailsLoadingStatus = LoadState.initial,
    this.listOfSearchedEvents,
  });

  DashboardState copyWith({
    LoadState? listLoadingStatus,
    List<EventModel>? listOfEvents,
    LoadState? eventDetailsLoadingStatus,
    List<EventModel>? listOfCachedEvents,
    List<EventModel>? listOfSearchedEvents,
  }) {
    return DashboardState(
      listLoadingStatus: listLoadingStatus ?? this.listLoadingStatus,
      listOfEvents: listOfEvents ?? this.listOfEvents,
      listOfCachedEvents: listOfCachedEvents ?? this.listOfCachedEvents,
      eventDetailsLoadingStatus:
          eventDetailsLoadingStatus ?? this.eventDetailsLoadingStatus,
      listOfSearchedEvents: listOfSearchedEvents ?? this.listOfSearchedEvents,
    );
  }

  @override
  List<Object?> get props => [
        listLoadingStatus,
        listOfEvents,
        eventDetailsLoadingStatus,
        listOfCachedEvents,
        listOfSearchedEvents,
      ];
}
