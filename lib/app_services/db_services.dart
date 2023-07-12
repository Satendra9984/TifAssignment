import '../app_models/event_model.dart';
import 'http_services.dart';

class DatabaseServices {
  static const String _baseUrl =
      'https://sde-007.api.assignment.theinternetfolks.works';

  Future<List<EventModel>> getEventList() async {
    List<EventModel> eventList = [];

    await HttpServices.sendGetReq('$_baseUrl/v1/event').then((list) {
      if (list == null) {
        // eventList = null;
        return;
      }

      List<dynamic> data = list['content']['data'];
      for (dynamic eventData in data) {
        Map<String, dynamic> eventJson = Map<String, dynamic>.from(eventData);
        EventModel model = EventModel.fromJson(eventJson);
        eventList.add(model);
      }
    });

    return eventList;
  }

  Future<List<EventModel>> getSearchEventList(String query) async {
    List<EventModel> eventList = [];

    await HttpServices.sendGetReq('$_baseUrl/v1/event?search=$query')
        .then((list) {
      if (list == null) {
        return;
      }

      List<dynamic> data = list['content']['data'];
      for (dynamic eventData in data) {
        Map<String, dynamic> eventJson = Map<String, dynamic>.from(eventData);
        EventModel model = EventModel.fromJson(eventJson);
        eventList.add(model);
      }
    });

    return eventList;
  }

  Future<EventModel?> getEventDetails(num id) async {
    EventModel? event;

    await HttpServices.sendGetReq('$_baseUrl/v1/event/$id').then((eventRest) {
      eventRest;
      if (eventRest == null) {
        return;
      }

      dynamic data = eventRest['content']['data'];
      Map<String, dynamic> eventJson = Map<String, dynamic>.from(data);
      event = EventModel.fromJson(eventJson);
    });
    event;
    return event;
  }
}
