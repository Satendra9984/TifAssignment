import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../app_models/app_enums.dart';
import '../../app_models/event_model.dart';
import '../../app_services/db_services.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit()
      : super(const DashboardState(
          listLoadingStatus: LoadState.initial,
          listOfSearchedEvents: [],
        ));

  Future<void> initializeEventsData() async {
    emit(state.copyWith(listLoadingStatus: LoadState.loading));

    try {
      await DatabaseServices().getEventList().then((events) {
        emit(state.copyWith(
          listLoadingStatus: LoadState.loaded,
          listOfEvents: events,
        ));
      });
    } catch (e) {
      emit(state.copyWith(listLoadingStatus: LoadState.errorLoading));
    }
  }

  Future<void> loadEventDetails(num eventId) async {
    emit(state.copyWith(eventDetailsLoadingStatus: LoadState.loading));

    try {
      // Check if already exists in cached events list
      if (state.listOfCachedEvents != null &&
          state.listOfCachedEvents!.isNotEmpty) {
        num index = state.listOfCachedEvents!
            .indexWhere((element) => element.id == eventId);
        if (index != -1) {
          emit(state.copyWith(eventDetailsLoadingStatus: LoadState.loaded));
          return;
        }
      }

      await DatabaseServices().getEventDetails(eventId).then((event) {
        event;
        if (event == null) {
          emit(state.copyWith(
              eventDetailsLoadingStatus: LoadState.errorLoading));
          return;
        }
        emit(state.copyWith(
          eventDetailsLoadingStatus: LoadState.loaded,
          listOfCachedEvents: [...?state.listOfCachedEvents, event],
        ));
      });
    } catch (e) {
      emit(state.copyWith(listLoadingStatus: LoadState.errorLoading));
    }
  }

  Future<void> refreshEventDetails(num eventId) async {
    emit(state.copyWith(eventDetailsLoadingStatus: LoadState.loading));

    try {
      // Check if already exists in cached events list
      await DatabaseServices().getEventDetails(eventId).then((event) {
        if (event == null) {
          emit(state.copyWith(
              eventDetailsLoadingStatus: LoadState.errorLoading));
          return;
        }
        emit(state.copyWith(
          eventDetailsLoadingStatus: LoadState.loaded,
          listOfCachedEvents: [...?state.listOfCachedEvents, event],
        ));
      });
    } catch (e) {
      emit(state.copyWith(eventDetailsLoadingStatus: LoadState.errorLoading));
    }
  }

  num getEventDetails(num eventId) {
    num index = -1;
    try {
      // Check if already exists in cached events list
      index = state.listOfCachedEvents!
          .indexWhere((element) => element.id == eventId);
    } catch (e) {
      emit(state.copyWith(listLoadingStatus: LoadState.errorLoading));
    }
    return index;
  }

  Future<void> loadSearchEvents(String query) async {
    try {
      // Check if already exists in cached events list
      await DatabaseServices().getSearchEventList(query).then((events) {
        emit(state.copyWith(
          listOfSearchedEvents: [...events],
        ));
      });
    } catch (e) {
      return;
    }
  }
}
